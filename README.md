# Projet DevOps Kubernetes (Kind + GitHub Codespaces)

Ce projet déploie une application NGINX sur un cluster Kubernetes local avec Kind.

## Technologies utilisées

- Kind
- kubectl
- GitHub Actions (CI lint Kubernetes)

## Étapes

### 1. Créer le cluster

```bash
kind create cluster --name devops-demo
```

### 2. Déployer

```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

### 3. Vérifier

```bash
kubectl get pods
kubectl get svc
```

### 4. Accéder à NGINX

```bash
kubectl port-forward svc/nginx-service 8080:80
```

Puis ouvrir : http://localhost:8080
