from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/book'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# define models
class Instanthelp(db.Model):
    __tablename__ = 'instanthelp'

    sessionid = db.Column(db.String(64))
    statusnum = db.Column(db.Integer)

    # constructor
    def __init__(self, sessionid, statusnum):
        self.sessionid = sessionid
        self.statusnum = statusnum

    # getters
    def getSessionId(self) -> str:
        return self.sessionid

    def getStatus(self) -> int:
        return self.statusnum

# status 0 = unattended
# stauts 1 = attended
def get(statusnum: int) -> list:
    instanthelpList = Instanthelp.query.filter_by(statusnum=statusnum).all()
    return instanthelpList

@app.route("/")
def main():
    unattendedList = get(0) # list of Instanthelp objects
    attendedList = get(1) # list of Instanthelp objects


if __name__ == "__main__":
    app.run(port = 9000, debug = True)