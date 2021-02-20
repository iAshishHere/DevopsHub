import flask
from flask import jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def test():
    return "<h1>This is API Server 1</h1>"

@app.route('/test', methods=['GET'])
def home():
    value = {"ashish":"Ashish"}
    return jsonify(value)

app.run(debug=True, host='0.0.0.0')