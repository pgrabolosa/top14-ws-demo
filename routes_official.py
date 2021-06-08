from flask import Blueprint
from flask import jsonify
from flask import request
from routes_authentication import checkRole
import database

app = Blueprint('official', __name__)

@app.route('/score', methods=['POST'])
def official_score_report():
    if not checkRole('referee'):
        return jsonify({'error': 'unauthorized'}), 401 

    try:
        data = request.get_json()
        assert(type(data) is dict)
        assert('score_home' in data) # type(data['score_home']) is int)
        assert('score_away' in data) # type(data['score_away']) is int)
        assert('team_home'  in data) # type(data['team_home'])  is str)
        assert('team_away'  in data) # type(data['team_away'])  is str)

        database.scores.append(data)
        return jsonify({'status': 'Done.'}), 201
    except Exception as e:
        return jsonify({'error': 'invalid input', 'error_detail': str(e)}), 400
