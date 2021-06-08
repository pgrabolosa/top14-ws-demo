from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

#### Data management
import database
import atexit
database.db_load()
atexit.register(database.db_save)
####

#### Routes
import routes_authentication
app.register_blueprint(routes_authentication.app, url_prefix="/auth")

import routes_official
app.register_blueprint(routes_official.app)

import routes_stats
app.register_blueprint(routes_stats.app)

@app.route('/_debug/reset')
def debug_reset():
    database.scores[:] = []
    return "Done."

## Start DEBUG (if main)
if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0', port=80)
