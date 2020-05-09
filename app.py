# run with gunicorn --worker-class eventlet -w 1 -b 0.0.0.0:8989 chat:app on aws

from flask import Flask, render_template, request, redirect, url_for
from flask_socketio import SocketIO, join_room, leave_room
from flask_sqlalchemy import SQLAlchemy
from opentok import OpenTok

###############
#   GLOBALS   #
###############
API_KEY = "46726452"
API_SECRET = "bd0687edf4065b7223e3f199ed00e3b84312696d"

################
#     INIT     #

# flask app
app = Flask(__name__)

# socket io plugin
socketio = SocketIO(app)

#sqlalchemy
db = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/health_database'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# opentok (video call) init
opentok = OpenTok(API_KEY, API_SECRET)

###########################
#     DATABASE MODELS     #
###########################
class InstantHelp(db.Model):
    __tablename__ = 'instanthelp'

    session_id = db.Column(db.String(64), primary_key=True)
    # status 0 = unattended
    # stauts 1 = attended
    status_num = db.Column(db.Integer)

    # constructor
    def __init__(self, session_id, status_num):
        self.session_id = session_id
        self.status_num = status_num
        
class User(db.Model):
    __tablename__ = 'user'
    
    username = db.Column(db.String(64), primary_key=True)
    fullname = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)
    # type 0 = patient
    # type 1 = therapist
    user_type = db.Column(db.Integer)


#################
#     FLASK     #
#################

@app.route('/')
def index():
    return render_template("index.html")
    
# user-type page
@app.route('/user')
def user_type():
    return render_template("user.html")

# for the user to join
@app.route('/chatnow')
def instanthelp():
    # here we create a opentok session to use as the unique id
    session = opentok.create_session() 
    
    # create a database entry
    help_table = InstantHelp(session.session_id, 0)
    
    # insert into the database
    db.session.add(help_table)
    db.session.commit()
    
    # append into the chat using administrator telling the user to wait for a therapist to attend to you asap
    return render_template("chatnow.html",
                           room = session.session_id,
                           username = "Anonymous")

# for the therapist to join will bring you into a room with an active user
@app.route('/helpnow')
def helpnow():
    # obtain an unattended session
    session = InstantHelp.query.filter_by(status_num=0).first()
    
    # change the status number
    session.status_num = 1
    
    # commit changes
    db.session.commit()
    return render_template("chatnow.html",
                           room = session.session_id,
                           username = "Anonymous")
    
# joint call with chat for the anon people who wish to open up
@app.route("/joint_room/<string:session_id>")
def joint_room(session_id):
    fullname = request.cookies.get("fullname","Anonymous").title()
    token = opentok.generate_token(session_id)
    return render_template("call.html", 
                           api_key    = API_KEY, 
                           session_id = session_id, 
                           token      = token, 
                           room       = session_id,  
                           username   = fullname
                        )   

##################
#    OPEN TOK    #
##################

@app.route("/room")
def room():
    # api will create a session when the user visits the "/room" url
    session = opentok.create_session() 
    # get the url for the function named join, pass in the session_id from the session into the url
    url = url_for("join", session_id=session.session_id) 
    return redirect(url)

# join the room using a given session_id
@app.route("/room/<string:session_id>")
def join(session_id):
    import random
    token = opentok.generate_token(session_id)
    return render_template("call.html", 
                           api_key    = API_KEY, 
                           session_id = session_id, 
                           token      = token, 
                           room       = session_id,  
                           username   = random.randint(1,10)
                        )
    
#################
#   SOCKET IO   #
#################

# event handler for sending a message
@socketio.on('send_message')
def handle_send_message_event(data):
    app.logger.info("{} has sent message to the room {}: {}".format(data['username'],
                                                                    data['room'],
                                                                    data['message']))
    # publishes a message to the room (data['room'])
    socketio.emit('receive_message', data, room=data['room'])

# event handler for joining a message
@socketio.on('join_room')
def handle_join_room_event(data):
    app.logger.info("{} has joined the room {}".format(data['username'], data['room']))
    join_room(data['room'])
    socketio.emit('join_room_announcement', data, room=data['room'])

# event handler for leaving a room
@socketio.on('leave_room')
def handle_leave_room_event(data):
    app.logger.info("{} has left the room {}".format(data['username'], data['room']))
    leave_room(data['room'])
    socketio.emit('leave_room_announcement', data, room=data['room'])

#############
#    RUN    #
#############
if __name__ == "__main__":
    socketio.run(app,
        host = "0.0.0.0",
        debug = True,
        port = 5000)