pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'myserver'
        SONARQUBE_PROJECT_KEY = 'joda-time'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/JodaOrg/joda-time.git', branch: 'master'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'  // This runs the Maven build
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t joda-time .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker run -d --name joda-container joda-time'
            }
        }
    }
}
