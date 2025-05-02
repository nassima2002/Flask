# Étape 1 : Build du frontend React
FROM node:20 AS frontend

WORKDIR /app/frontend

COPY frontend-react/ ./       
RUN npm install
RUN npm run build             # Crée un build optimisé de React

# Étape 2 : Build du backend Python
FROM python:3.11-bookworm AS backend

WORKDIR /app

# Copie du backend
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copier le code backend
COPY . .

# Copier le build React dans le backend (ex: dossier static pour Flask)
COPY --from=frontend /app/frontend/build ./frontend-build

# Port exposé (selon ton app, exemple 5000 pour Flask)
EXPOSE 5000

# Commande de lancement (à adapter à ton backend)
CMD ["python", "app.py"]
