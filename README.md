# Overview
# Overview
The udagram users service is a microservice built with **ExpressJS** and **Typescript** provisioned for an **AWS EKS Cluster**. The microservice is refactored from the monolith version of [Udagram](https://github.com/meddy672/udagram-monolith). The microservice consists of an simple API handles authentication and locating users within the system.

### Required Software
1. Node.js 11.15.0
2. PostgreSQL Community Server

### Local Usage
1. Clone or download the repository
2. `cd` into root directory and run `npm install`
3. Create a .env file and setup database connection within the **config.ts** 
4. Run `npm run dev` to start the local development server.

### Docker Usage
1. Download and install [Docker](https://www.docker.com/)
2. Clone or download the repository
3. `cd` into the root directory
4. Run the command `docker run -d -p 3000:8080 --env POSTGRES_USERNAME=**setup** --env POSTGRES_PASSWORD=**setup** --env POSTGRES_HOST=**setup** --env POSTGRES_DB=**setup** --env URL=**setup** <image-id>`

### AWS EKS Usage
1. Install Kubernetes command line tool [kubectl](https://kubernetes.io/docs/tasks/tools/).
2. Create an AWS EKS Cluster and a Node Group
3. Create a secrets.yaml 
#### Example
```
apiVersion: v1
kind: Secret
metadata:
  name: secrets
stringData:
  POSTGRES_USERNAME: **setup**
  POSTGRES_PASSWORD: **setup**
  POSTGRES_HOST: **setup**
  POSTGRES_DB: **setup**
  URL: **setup**
```
4. Using the AWS CLI run the command `aws eks --region <region-of-eks-cluster> update-kubeconfig --name <name-of-cluster>`
5. Using the terminal or command prompt run the command `kubectl create -f secrets.yaml`
6. Using the the terminal or command prompt run the command `kubectl apply -f deployment.yaml` and then run `kubectl apply -f service.yaml`
7. Verify the pods are running with `kubectl get pods`

#### More on kubernetes
To learn about the kubectl commands visit [kubectl docs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
