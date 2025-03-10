# K3s Installation

### Install and create controle node/plane

```bash
curl -sfL https://get.k3s.io | sh -
sudo cp /etc/rancher/k3s/k3s.yaml ~
sudo chown -R ubuntu k3s.yaml
export KUBECONFIG=~/k3s.yaml
```

### Install worker node

```bash
curl -sfL https://get.k3s.io | K3S_URL=https://server-ip-address:6443 K3S_TOKEN=mynodetoken sh -
```

### Token location

```bash
cat /var/lib/rancher/k3s/server/node-token
```

### Install Helm

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod 700 get_helm.sh

./get_helm.sh
```

### Install ArgoCD

```bash
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
