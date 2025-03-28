from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# Définir l'environnement de l'application
app.config['ENV'] = 'development'  # ou 'production' pour un déploiement en production
app.config['DEBUG'] = True  # Activer le mode debug pour la version de développement
app.config['TEMPLATES_AUTO_RELOAD'] = True  # Rechargement automatique des templates

# Liste pour stocker les étudiants
students = []

@app.route('/')
def index():
    return render_template('index.html', students=students)

@app.route('/add', methods=['POST'])
def add_student():
    # Récupérer les données du formulaire
    name = request.form.get('name')
    age = request.form.get('age')
    grade = request.form.get('grade')

    # Vérifier si les champs sont remplis
    if name and age and grade:
        # Ajouter les informations de l'étudiant dans la liste
        students.append({'name': name, 'age': age, 'grade': grade})
    
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)  # Le mode debug est activé pour afficher les erreurs détaillées
