![Architecture diagram](architecture.excalidraw.png)

# Azure DevOps AKS ArgoCD GitOps Project

## Overview

Implemented an end-to-end CI/CD and GitOps workflow for a microservices application using Azure DevOps, Docker, Azure Container Registry, AKS and ArgoCD.

The project demonstrates automated container build, image publishing, Kubernetes manifest updates and GitOps-based deployments.

---

## Architecture

(Add architecture image here)

Developer
|
v
Azure Repo/GitHub
|
v
Azure DevOps Pipeline
|
+--> Docker Build
|
+--> Push Image to ACR
|
v
Update Kubernetes Manifest
|
v
GitOps Repository
|
v
ArgoCD
|
v
AKS Cluster

---

## Tech Stack

- Azure DevOps
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Docker
- Kubernetes
- ArgoCD
- Bash
- Git

---

## Application Components

Microservices:

- Vote App (Python)
- Result App (Node.js)
- Worker Service (.NET)
- Redis
- PostgreSQL

---

## CI Pipeline

Azure DevOps pipeline performs:

- Build Docker images
- Tag images with Build ID
- Push images to ACR

Pipeline stages:

1. Build and Push
2. Update Kubernetes Manifest

---

## GitOps Workflow

ArgoCD continuously monitors Kubernetes manifests stored in Git.

When pipeline updates the image tag:

Example:

Before:

image: vote:v1

After:

image: vote:v2

ArgoCD detects the change and synchronizes AKS automatically.

---

## Kubernetes Resources

Created:

- Deployments
- Services
- LoadBalancer Services
- Pods
- ReplicaSets

---

## Challenges Faced

### 1. AKS unable to pull images from ACR

Problem:
ImagePullBackOff error.

Solution:
Configured AKS authentication with Azure Container Registry.

### 2. Application not accessible externally

Problem:
Pods running but no browser access.

Solution:
Configured Kubernetes LoadBalancer service.

### 3. Automating image updates

Problem:
New images were created but manifests contained old tags.

Solution:
Created Bash automation script to update manifests and push changes.

### 4. Pipeline script issues

Problems:

- CRLF errors
- Permission issues
- Incorrect paths

Solutions:
Used:

sed -i 's/\r$//'

chmod +x

### 5. Secret cleanup before open source

Removed:

- PAT tokens
- Credentials
- Old Git history

---

## Screenshots

### Azure DevOps Pipeline

(image)

### Azure Container Registry

(image)

### ArgoCD GitOps

(image)

### AKS Deployment

(image)

---

## Outcome

Successfully created a complete GitOps-based deployment workflow where application changes automatically flow from source code to Kubernetes deployment.
