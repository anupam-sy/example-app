from flask import Flask, redirect, url_for, render_template, request, session
from .validlogin import valid_login

app = Flask(__name__)
 
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if(request.method == "POST"):
        if(valid_login(request.form["t1"], request.form["t2"])):
            session["username"] = request.form["t1"]
            return redirect(url_for("home"))
        else:
            errorMsg = "Incorrect Username or Password."
            return render_template("login.html", error = errorMsg)
    return render_template("login.html")

@app.route("/home")
def home():
    return render_template("home.html", user = session["username"])

@app.route("/logout")
def logout():
    session.pop("username", None)
    return redirect(url_for("login"))

@app.route("/maintenance")
def maintenance():
    return "Sorry, we are under maintenance. Try to login with same username and password."
            

