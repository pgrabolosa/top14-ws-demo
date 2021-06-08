from flask import Blueprint
from flask import jsonify
from routes_authentication import checkRole

import database

app = Blueprint('stats', __name__)

@app.route('/standings')
def stats_standings():    
    if not checkRole('press'):
        return jsonify({'error': 'unauthorized'}), 401 

    teams = {}

    for score in database.scores:
        if score['team_home'] not in teams: teams[score['team_home']] = 0
        if score['team_away'] not in teams: teams[score['team_away']] = 0

        if score['score_home'] > score['score_away']:
            teams[score['team_home']] += 3
        elif score['score_away'] > score['score_home']:
            teams[score['team_away']] += 3
        else:
            teams[score['team_home']] += 1
            teams[score['team_away']] += 1

    standings = []
    for k in teams:
        standings.append({"name": k, "points": teams[k]})
    standings.sort(key=lambda value: value['points'], reverse=True)

    return jsonify(standings)
