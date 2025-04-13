import pytest
from app import create_app

@pytest.fixture(scope='module')
def test_client():
    """Fixture pour créer un client de test"""
    app = create_app()
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    with app.test_client() as client:
        yield client

def test_not_found(test_client):
    """Test d'une route non existante (erreur 404)"""
    response = test_client.get('/not-a-real-route')
    assert response.status_code == 404
