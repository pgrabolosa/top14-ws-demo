import json

scores = []

users = [
    {'login': 'toto', 'password': '123456', 'roles': ['referee']},
    {'login': 'babar', 'password': '123456', 'roles': ['press']},
    {'login': 'pierre', 'password': '123456', 'roles': ['referee','press']}
]

def db_load():
    try:
        with open('backup.json', 'r') as file:
            scores[:] = json.load(file)
    except:
        pass # fail silently

def db_save():
    try:
        with open('backup.json', 'w') as file:
            json.dump(scores, file)
    except:
        pass