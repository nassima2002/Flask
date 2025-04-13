from flask import Flask, render_template
from app.routes import register_routes

def create_app():
    app = Flask(__name__)
    register_routes(app)
    return app

app = create_app()



if __name__ == '__main__':
    app.run(debug=True)
