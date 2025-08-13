pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-docker-image"
        IMAGE_TAG = "latest"
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
                echo "Running OWASP Dependency-Check..."
                bat """
                    mvn org.owasp:dependency-check-maven:check ^
                        -Dformat=ALL ^
                        -DoutputDirectory=${REPORT_DIR}
                """
                archiveArtifacts artifacts: "${REPORT_DIR}/*.*", fingerprint: true
            }
        }

        stage('Run Unit Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Supply Chain Verification') {
            steps {
                script {
                    def cosignExists = bat(
                        script: 'where cosign',
                        returnStatus: true
                    ) == 0
                    if (cosignExists) {
                        echo 'Cosign found. Running verification...'
                        bat "cosign verify --key public.key ${IMAGE_NAME}:${IMAGE_TAG}"
                    } else {
                        echo '⚠ Cosign not found — skipping supply chain verification.'
                    }
                }
            }
        }

        stage('Trivy Image Scan') {
            steps {
                echo 'Running Trivy vulnerability scan...'
                bat "trivy image --exit-code 0 --severity HIGH,CRITICAL ${IMAGE_NAME}:${IMAGE_TAG}"
                bat "trivy image --exit-code 1 --severity CRITICAL ${IMAGE_NAME}:${IMAGE_TAG}"
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
            cleanWs()
        }
    }
}
