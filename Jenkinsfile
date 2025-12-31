pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t techops-pipeline-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --rm techops-pipeline-app'
            }
        }
    }
}
