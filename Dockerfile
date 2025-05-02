# Étape 1 : Construire le frontend React
FROM node:20 AS frontend
WORKDIR /frontend
COPY frontend-react/package*.json ./
RUN npm install
COPY frontend-react/ ./
RUN npm run build

# Étape 2 : Construire le backend Flask
FROM python:3.11-slim AS backend
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Copier les fichiers générés par le frontend dans le backend
COPY --from=frontend /frontend/build /app/frontend

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
