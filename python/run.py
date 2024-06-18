from src.main import app

if __name__ == "__main__":
    app.debug = True
    app.secret_key = "any random string"
    app.run(host="0.0.0.0", port=4999)
