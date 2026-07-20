# CodeAlpha AWS CI/CD DevOps Project

## Overview

This project demonstrates the implementation of a CI/CD pipeline for deploying a containerized web application using AWS services, Docker, and GitHub Actions.

The goal of this project was to automate the process of building a Docker image, storing it in a container registry, and deploying the application to an AWS EC2 instance.

## Architecture
<img width="1280" height="430" alt="architecture_diagram" src="https://github.com/user-attachments/assets/82ae1a0d-05b8-489a-978c-07e5d923fbf3" />

## Technologies Used

* AWS EC2
* Amazon Elastic Container Registry (ECR)
* AWS CloudWatch
* Docker
* GitHub Actions
* Linux
* Nginx
* Git and GitHub

## Project Implementation Steps

### Step 1: Create the Web Application
<img width="1280" height="760" alt="Live_website" src="https://github.com/user-attachments/assets/3477c352-5c0d-413b-9808-f5bd9823ba73" />

I created a simple HTML website to demonstrate the deployment process.

The application contains:

* Project information
* Technologies used
* CI/CD workflow explanation
* Cloud and DevOps journey overview

## Step 2: Containerized the Application Using Docker

I created a Dockerfile to package the website into a Docker image.

The Docker image was built locally on an AWS EC2 Linux environment because my personal laptop had compatibility limitations with Docker.

Commands used:

```bash
docker build -t aws-cicd-project.
```

The container was tested successfully by running it on EC2.

```bash
docker run -d -p 80:80 --name codealpha-web aws-cicd-project
```

## Step 3: Created Amazon ECR Repository
<img width="1280" height="748" alt="ECR_Repository" src="https://github.com/user-attachments/assets/f96e443e-b160-4570-9242-855e382f3f16" />

I created an Amazon Elastic Container Registry (ECR) repository to store Docker images.

The Docker image was tagged and pushed to ECR.

Example workflow:

```bash
aws ecr get-login-password --region us-east-1

docker tag aws-cicd-project:latest <ECR-Repository-URI>

docker push <ECR-Repository-URI>
```

## Step 4: Configured GitHub Repository
<img width="1280" height="644" alt="GitHub_Repository" src="https://github.com/user-attachments/assets/3824ab5a-a779-4510-b20a-84eef50b6b9e" />

I uploaded the project source code to GitHub.

Repository structure:

```
CodeAlpha_AWS-CICD-Project

├── index.html
├── Dockerfile
├── deploy.sh
├── README.md
└── .github
    └── workflows
        └── deploy.yml
```

## Step 5: Created CI/CD Pipeline Using GitHub Actions

I created a GitHub Actions workflow to automate:

1. Checking out the source code
2. Configuring AWS credentials
3. Building the Docker image
4. Logging into Amazon ECR
5. Pushing the image to ECR
6. Connecting to EC2 through SSH
7. Deploying the updated container

The workflow is triggered whenever changes are pushed to the main branch.

## Step 6: Automated Deployment to EC2

I configured secure SSH access between GitHub Actions and the EC2 instance.

The deployment script:

* Pulls the latest Docker image from ECR
* Stops the previous container
* Starts the updated container
* Makes the latest application version available

## Deployment Validation

The deployment was tested by:

Checking the running Docker container:

```bash
docker ps
```

Testing the application locally:

```bash
curl localhost
```

Accessing the application through the EC2 public IP address.

## Challenges and Troubleshooting
<img width="1280" height="677" alt="Challenges_and_Troubleshooting" src="https://github.com/user-attachments/assets/460dadf1-e44d-4583-8a40-dd2919cacdca" />

During implementation, several real-world DevOps issues were resolved:

* Docker permission issues on EC2
* AWS IAM permission configuration for ECR access
* Git authentication using Personal Access Tokens
* GitHub Actions YAML indentation errors
* SSH authentication between GitHub Actions and EC2

These troubleshooting steps helped strengthen understanding of cloud infrastructure, automation, and deployment workflows.

## Monitoring and Observability

Amazon CloudWatch was configured to monitor the EC2 instance hosting the containerized application.

CloudWatch metrics provide visibility into infrastructure performance, including:

* CPU utilisation
* Network activity
* Instance health status
* Resource performance trends

The monitoring dashboard helps track the application's hosting environment and supports troubleshooting by identifying potential performance issues.

## Updated Project Workflow

The complete workflow now includes:

1. Developer pushes code changes to GitHub
2. GitHub Actions automatically builds the Docker image
3. Docker image is pushed to Amazon ECR
4. GitHub Actions connects securely to EC2
5. The updated container is deployed
6. CloudWatch monitors EC2 performance metrics

## Author

Mabel Omolaja
Cloud & DevOps Engineer (Aspiring) 
