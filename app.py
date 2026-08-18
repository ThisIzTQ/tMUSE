from flask import Flask, render_template
from config import Config
from db import db, System

app = Flask(__name__)

app.config.from_object(Config)

db.init_app(app)


@app.route("/")
@app.route("/login")
def login():
    return render_template("login.html")


@app.route("/dashboard")
def dashboard():

    systems = System.query.all()

    return render_template(
        "dashboard.html",
        systems=systems
    )


if __name__ == "__main__":
    app.run(debug=True)