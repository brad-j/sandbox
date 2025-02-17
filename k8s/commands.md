# Deployments

# Get Deployment
k get deployments

# Create Deployment - Creating a sample deploy yaml
k create deploy NAME --image=IMAGE_NAME --replicas=NUMBER --dry-run=client -o yaml > FILENAME.yaml

# Apply Deployment
k apply -f FILENAME.yaml

# Namespaces

# Get Namespaces
k get namespaces
