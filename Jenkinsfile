pipeline {
    agent any // Run on Jenkins host

    environment {
        APP_NAME = "docker2025"
        JAR_NAME = "target/${APP_NAME}-1.0-SNAPSHOT.jar"
        IMAGE_NAME = "ck2135/${APP_NAME}:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ck2135/docker2025.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify Build') {
            steps {
                sh 'ls target/'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Application in Docker') {
            steps {
                // Check if container exists and remove it before running a new one
                sh '''
                if [ $(docker ps -aq -f name=${APP_NAME}) ]; then
                    docker stop ${APP_NAME}
                    docker rm ${APP_NAME}
                fi
                docker run -d -p 80:8081 --name ${APP_NAME} ${IMAGE_NAME}
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application is running at http://localhost:8080"
        }
        failure {
            echo "❌ Build Failed! Check the logs."
        }
    }
}
