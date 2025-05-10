# Application Architecture
Simple application that directly return json

# Requirement
Flask==3.0.3
gunicorn==21.2.0

# Endpoint
/about/me => Show simple about
/echo => Show simple post request data
/status => Show status

# CURL Example
curl -X GET http://localhost:5000/
curl -X GET http://localhost:5000/about/me
curl -X GET http://localhost:5000/status
curl -X POST http://localhost:5000/echo -H "Content-Type: application/json" -d '{"data": "ini data"}'

# Build Docker Image
docker build -t vourteen14/devops-angga:1.0 .

# Push to Dockerhub
docker push vourteen14/devops-angga:1.0