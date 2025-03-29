pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'myserver'  // Ensure this matches the Jenkins configuration
        SONARQUBE_PROJECT_KEY = 'joda-time'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/yeezerdaw/joda-time.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'  // This runs the Maven build
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('myserver') {  // Ensure 'myserver' is correctly configured in Jenkins
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    if (fileExists('Dockerfile')) {
                        sh 'docker build -t joda-time .'
                    } else {
                        error 'Dockerfile not found! Please add one to the repository.'
                    }
                }
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run -d --name joda-container joda-time'
            }
        }
    }
}
