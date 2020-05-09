# run with gunicorn --worker-class eventlet -w 1 -b 0.0.0.0:8989 chat:app on aws

from flask import Flask, render_template, request, redirect, url_for
from flask_socketio import SocketIO, join_room, leave_room
from opentok import OpenTok

###############
#   GLOBALS   #
###############
API_KEY = "46726452"
API_SECRET = "bd0687edf4065b7223e3f199ed00e3b84312696d"

################
#     INIT     #
################

# flask app
app = Flask(__name__)

# socket io plugin
socketio = SocketIO(app)

# opentok (video call) init
opentok = OpenTok(API_KEY, API_SECRET)

@app.route("/debug")
def debug():
    return "debug"

# index page
@app.route('/')
def home():
    return render_template("index.html")

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

#########
#  RUN  #
#########
if __name__ == "__main__":
    socketio.run(app,
        host = "0.0.0.0",
        debug = True,
        port = 5000)