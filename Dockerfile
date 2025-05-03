# Étape 1 : Construire le frontend React
FROM node:20 AS frontend
WORKDIR /frontend

# Copier seulement les fichiers package.json et package-lock.json pour éviter de réinstaller les dépendances à chaque modification du code
COPY frontend-react/package*.json ./
RUN npm install

# Copier le reste des fichiers frontend
COPY frontend-react/ ./

# Construire le frontend React
RUN npm run build

# Étape 2 : Construire le backend Flask
FROM python:3.11-slim AS backend
WORKDIR /app

# Copier le fichier requirements.txt et installer les dépendances
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le reste du code du backend
COPY . .

# Copier les fichiers générés par le frontend dans le répertoire du backend
COPY --from=frontend /frontend/build /app/frontend

# Exposer le port pour l'application Flask
EXPOSE 8000

# Lancer l'application Flask avec gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
