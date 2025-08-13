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
                        -DoutputDirectory=dependency-check-report
                """
                archiveArtifacts artifacts: 'dependency-check-report/*', fingerprint: true
            }
        }

        stage('Supply Chain Verification with Cosign') {
            steps {
                script {
                    def cosignExists = bat(
                        script: 'where cosign',
                        returnStatus: true
                    ) == 0

                    if (cosignExists) {
                        echo 'Cosign found. Running verification...'
                        bat 'cosign verify --key public.key my-docker-image:latest'
                    } else {
                        echo '⚠ Cosign not found — skipping supply chain verification.'
                    }
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Trivy Scan') {
            steps {
                echo 'Running Trivy vulnerability scan...'
                bat 'trivy image my-docker-image:latest'
            }
        }

        stage('Start Services with Docker Compose') {
            steps {
                bat 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Please check logs.'
        }
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}
