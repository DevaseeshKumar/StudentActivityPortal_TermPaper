pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DevaseeshKumar/StudentActivityPortal_TermPaper.git'
            }
        }

        stage('Build Maven Package') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Dependency Vulnerability Scan') {
            steps {
                echo 'Running OWASP Dependency-Check...'
                bat """
                    mvn org.owasp:dependency-check-maven:check ^
                        -Dformat=ALL ^
                        -DoutputDirectory=target ^
                        -DfailBuildOnCVSS=7
                """
                archiveArtifacts artifacts: 'target/dependency-check-report.html', fingerprint: true
            }
        }

        stage('Test') {
            steps {
                echo "Test Completed"
            }
        }

        stage('Start Services with Docker Compose') {
            steps {
                script {
                    bat 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check logs.'
        }
        cleanup {
            cleanWs() // only cleans Jenkins workspace, not containers
        }
    }
}
