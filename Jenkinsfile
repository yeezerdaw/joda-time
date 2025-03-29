pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'myserver'  // Ensure this matches the Jenkins configuration
        SONARQUBE_PROJECT_KEY = 'joda-time'
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk-amd64'  // Set the correct Java path
        PATH = "${JAVA_HOME}/bin:${env.PATH}"  // Ensure Java binaries are available in PATH
        SONARQUBE_TOKEN = 'your-sonar-token'  // Pass your SonarQube token directly here
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
                    // Pass token for authentication
                    sh "mvn sonar:sonar -Dsonar.login=${squ_f9914977197b94b997e4ddb93f77b0a19ca4d9c9}"
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
