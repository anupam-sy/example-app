def valid_login(username, password):
    if((username == password) and username != "" and password != ""):
        return True
    else:
        return False
