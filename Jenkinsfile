pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "rahulkhetwal/techops-pipeline-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE:latest'
            }
        }

        stage('Logout from Docker Hub') {
            steps {
                sh 'docker logout'
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed successfully to Docker Hub!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs."
        }
    }
}
