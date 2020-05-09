from flask import Flask, redirect, url_for,render_template
# from opentok import OpenTok

API_KEY = "46726452"
API_SECRET = "bd0687edf4065b7223e3f199ed00e3b84312696d"
# opentok = OpenTok(API_KEY, API_SECRET)

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")
    
@app.route("/user")
def user():
    return "user"

@app.route("/therapist")
def therapist():
    return "therapist"

<<<<<<< HEAD
@app.route("/room")
def room():
    session = opentok.create_session()
    url = url_for("join", session_id=session.session_id)
    return redirect(url)

@app.route("/room/<string:session_id>")
def join(session_id):
    token = opentok.generate_token(session_id)
    return render_template("chat.html", api_key=API_KEY, session_id=session_id, token=token)

=======
# @app.route("/room")
# def room():
#     session = opentok.create_session()
#     url= url_for("join",session_id=session.session_id)
#     return redirect(url)
    
# @app.route("/room/<string:session_id>")
# def join(session_id):
#     token=opentok.generate_token(session_id)
#     return render_template("chat.html", api_key=API_KEY, session_id=session_id, token=token)
    
    
>>>>>>> fab2f0517219a08e285b5d50e8d0575a85b78a46
if __name__ == "__main__":
    app.run(host = "0.0.0.0",
            debug = True,
            port = 5000)