# Description
This is Kubernetes manifest for deploy the flask application

# Apply Ingress Certificae 
kubectl apply -f wildcard-cert.yaml

# Apply Flask Apps
kubectl apply -f flask-deployment.yaml
kubectl apply -f flask-service.yaml

# Apply KEDA External Service
kubectl apply -f flask-keda-external-service.yaml

# Apply KEDA Ingress Flask Apps Proxy
kubectl apply -f flask-keda-ingress.yaml

# Apply KEDA HTTP Scaled Object
kubectl apply -f flask-keda-httpscaledobject.yaml