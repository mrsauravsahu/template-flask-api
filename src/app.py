from flask import Flask
app = Flask(__name__)

@app.route('/')
def root():
    return { 'app': 'template-flask-api' }

@app.route('/ping')
def ping():
    return { 'message': 'pong' }

if __name__ == '__main__':
    app.run()