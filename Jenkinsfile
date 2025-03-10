pipeline {
    agent any // ✅ Run on Jenkins host, NOT inside a Docker container

    environment {
        APP_NAME = "docker2025"
        JAR_NAME = "target/${APP_NAME}-1.0-SNAPSHOT.jar"
        IMAGE_NAME = "ck2135/${APP_NAME}:latest" // Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ck2135/docker2025.git'  // ✅ Ensure the correct branch
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'sudo apt-get update && sudo apt-get install -y git maven docker.io'  // ✅ Ensure Git, Maven, and Docker are installed
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'  // ✅ Build the Java app
            }
        }

        stage('Verify Build') {
            steps {
                sh 'ls target/'  // ✅ Check if JAR exists
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'  // ✅ Build the Docker image
            }
        }

        stage('Run Application in Docker') {
            steps {
                sh 'docker run -d -p 8080:8080 --name ${APP_NAME} ${IMAGE_NAME}'  // ✅ Run the app in Docker
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


