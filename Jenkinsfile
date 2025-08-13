pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-docker-image:latest"
        REPORT_DIR = "dependency-check-report"
    }

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
                        -DoutputDirectory=${REPORT_DIR}
                """
                archiveArtifacts artifacts: "${REPORT_DIR}/dependency-check-report.html", fingerprint: true
            }
        }

        stage('Supply Chain Verification') {
            steps {
                script {
                    def cosignExists = bat(script: 'where cosign', returnStatus: true) == 0
                    if (cosignExists) {
                        echo 'Cosign found. Verifying image signature...'
                        bat "cosign verify --key public.key ${IMAGE_NAME}"
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

        stage('Build & Scan Docker Image') {
            steps {
                script {
                    bat "docker build -t ${IMAGE_NAME} ."
                    def trivyExists = bat(script: 'where trivy', returnStatus: true) == 0
                    if (trivyExists) {
                        echo 'Running Trivy vulnerability scan...'
                        bat "trivy image ${IMAGE_NAME}"
                    } else {
                        echo '⚠ Trivy not found — skipping image scan.'
                    }
                }
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
        cleanup {
            cleanWs()
        }
    }
}
