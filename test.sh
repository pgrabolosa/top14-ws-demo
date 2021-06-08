WEBHOST="127.0.0.1"

TOKEN_PRESS=`curl -s http://babar:123456@$WEBHOST/auth/token`
TOKEN_REFEREE=`curl -s http://toto:123456@$WEBHOST/auth/token`
TOKEN_ALL=`curl -s http://pierre:123456@$WEBHOST/auth/token`

curl -s http://127.0.0.1/_debug/reset 2>&1 > /dev/null

curl -X POST -s -d '{"journee": 1, "team_away": "USAP", "team_home": "Toulon",             "score_away": 66, "score_home": 9}'  -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 1, "team_away": "Toulouse", "team_home": "La Rochelle",    "score_away": 42, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 1, "team_away": "Paris", "team_home": "Bordeaux",          "score_away": 33, "score_home": 50}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 1, "team_away": "Racing 92", "team_home": "Pau",           "score_away": 12, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null

curl -X POST -s -d '{"journee": 2, "team_away": "USAP", "team_home": "Toulouse",           "score_away": 66, "score_home": 9}'  -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 2, "team_away": "Toulon", "team_home": "La Rochelle",      "score_away": 42, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 2, "team_away": "Pau", "team_home": "Bordeaux",            "score_away": 33, "score_home": 50}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 2, "team_away": "Racing 92", "team_home": "Paris",         "score_away": 12, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null

curl -X POST -s -d '{"journee": 3, "team_away": "USAP", "team_home": "La Rochelle",        "score_away": 66, "score_home": 9}'  -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 3, "team_away": "Toulon", "team_home": "Bordeaux",         "score_away": 42, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 3, "team_away": "Pau", "team_home": "Paris",               "score_away": 33, "score_home": 50}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null
curl -X POST -s -d '{"journee": 3, "team_away": "Racing 92", "team_home": "Toulon",        "score_away": 12, "score_home": 12}' -H 'Content-Type: application/json' -H "Authorization: Bearer $TOKEN_REFEREE" -s http://$WEBHOST/score 2>&1 > /dev/null

curl -H "Authorization: Bearer $TOKEN_PRESS" -s http://$WEBHOST/standings
