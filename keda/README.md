# Description
Kubernetes YAML and HELM manifest for deploy KEDA (Kubernetes Even Driven Autoscalling), we use version 2.17.0 for KEDA and 0.10.0 for KEDA http-add-on. 

Also I have write the script for load test using k6 for test the autoscalling

# Apply Namespace
kubectl apply -f namespace.yaml

# Initialize Required Helm Chart
helm repo add keda https://kedacore.github.io/charts
helm repo update

# Install KEDA
helm upgrade keda --install --namespace keda --version "2.17.0" keda/keda

# Install HTTP Add On Keda
helm upgrade http-add-on --install --namespace keda --version "0.10.0" keda/keda-add-ons-http

# For Install k6 Load Test on Ubuntu 22.04
sudo apt update
sudo apt install gnupg ca-certificates curl -y

curl -s https://dl.k6.io/key.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/k6.gpg
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list

sudo apt update
sudo apt install k6 -y

# Run the load test
k6 run keda-k6-loadtest.js

Note: Adjust the URL
