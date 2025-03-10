pipeline {
    agent {
        docker { image 'maven:3.8.1-openjdk-11' } // Use Maven with JDK 11 inside Docker
    }

    environment {
        APP_NAME = "docker2025"
        JAR_NAME = "target/${APP_NAME}-1.0-SNAPSHOT.jar"
        IMAGE_NAME = "ck2135/${APP_NAME}:latest" // Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ck2135/docker2025.git'  // Clone your repo
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'  // Build the Java app
            }
        }

        stage('Verify Build') {
            steps {
                sh 'ls target/'  // Check if JAR is created
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'  // Build a Docker image
            }
        }

        stage('Run Application in Docker') {
            steps {
                sh 'docker run -d -p 8080:8080 --name ${APP_NAME} ${IMAGE_NAME}'  // Run the app in Docker
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


