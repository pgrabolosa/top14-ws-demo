from flask import Blueprint
from flask import jsonify
from flask import request
from jose import jwt
from time import time

from database import users

app = Blueprint('auth', __name__)

#TODO: make the secret configurable
secret = 'B4B4R+t0t0'

def getValidToken():
    try:
        value = request.headers.get('Authorization')
        prefix = 'Bearer '
        token = value[len(prefix):]

        payload = jwt.decode(token, secret)
        return payload
    except:
        return None

def checkRole(name):
    token = getValidToken()
    try:
        return name in token.get('roles')
    except:
        return False

@app.route('/token', methods=['GET'])
def auth_generateToken():
    try:
        auth = request.authorization
        assert(auth is not None)
        
        # search for the user
        found = None
        for user in users:
            if (user['login'], user['password']) == (auth.username, auth.password):
                found = user
                break
        assert(found is not None)

        now = int(time())
        one_min_from_now = now + 60
        token = jwt.encode({'sub': auth.username, 'iat': now, 'exp': one_min_from_now, 'roles': user['roles']}, secret)

        return token, 200, {'Content-Type': 'text/plain'}
    except:
        return jsonify({'error': 'invalid credentials'}), 401
