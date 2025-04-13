from flask import render_template

def register_routes(app):
    # Route principale qui affiche la liste des étudiants
    @app.route('/')
    def index():
    
        return render_template('index.html')

    @app.route('/signup')
    def signup():
    
        return render_template('inscription.html')
