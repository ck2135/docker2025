pipeline {
    agent {
        docker { image 'maven:3.8.1-openjdk-11' } // Use Maven with JDK 11 inside Docker
    }

    environment {
        APP_NAME = "docker2025"
        JAR_NAME = "target/${APP_NAME}-1.0-SNAPSHOT.jar"
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

        stage('Run') {
            steps {
                sh "nohup java -jar $JAR_NAME > app.log 2>&1 &"
                sh "sleep 5 && ps aux | grep java"  // Check if the app is running
            }
        }
    }

    post {
        success {
            echo "✅ Application is running!"
        }
        failure {
            echo "❌ Build Failed! Check the logs."
        }
    }
}

