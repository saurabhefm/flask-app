pipeline{
    agent any

    environment {
        VERSION = "${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout code') {
            steps {
                git branch: 'main', url: 'https://github.com/saurabhefm/flask-app.git'
            }

        }

        stage('Build and Deploy') {
            steps {
                script {
                    sh "echo 'VERSION=${VERSION}' > .env"
                    sh 'docker-compose --env-file .env up --build -d'
                }
            }
        }
    }
}

