from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/status', methods=['GET'])
def status():
    return jsonify({"status": "ok"})

@app.route('/about/me', methods=['GET'])
def about():
    data = {
        "nama": "Angga Suriana",
        "pekerjaan": "DevOps Engineer"
    }
    return jsonify(data)

@app.route('/echo', methods=['POST'])
def echo():
    data = request.get_json()
    return jsonify({"data": data})

@app.route('/', methods=['GET'])
def index():
    routes = {
        "/status [GET]": "Health Check Endpoint",
        "/about/me [GET]": "About Me",
        "/echo [POST]": "Display Data Using POST Method",
    }
    return jsonify(routes)

if __name__ == '__main__':
    app.run(debug=True)
