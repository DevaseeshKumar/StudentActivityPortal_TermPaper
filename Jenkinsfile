pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-docker-image:latest"
    }

    stages {
        stage('Dependency-Check') {
            steps {
                echo 'Running OWASP Dependency-Check...'
                // Ensure Maven + Plugin works on Windows
                bat """
                    mvn clean install
                    mvn org.owasp:dependency-check-maven:check ^
                        -Dformat=ALL ^
                        -DoutputDirectory=dependency-check-report ^
                        -DanalyzerCentralEnabled=true ^
                        -DanalyzerRetireJsEnabled=true
                """
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Supply Chain Attack Checks') {
            steps {
                script {
                    def cosignExists = bat(
                        script: 'where cosign',
                        returnStatus: true
                    ) == 0

                    if (cosignExists) {
                        echo 'Cosign found. Running verification...'
                        // Ensure the image is pushed or exists locally
                        bat "cosign verify --key public.key %IMAGE_NAME%"
                    } else {
                        echo '⚠ Cosign not found — skipping supply chain verification.'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running unit tests...'
                bat 'mvn test'
            }
        }

        stage('Trivy Scan') {
            steps {
                script {
                    def trivyExists = bat(
                        script: 'where trivy',
                        returnStatus: true
                    ) == 0

                    if (trivyExists) {
                        echo 'Running Trivy vulnerability scan...'
                        bat "trivy image %IMAGE_NAME%"
                    } else {
                        echo '⚠ Trivy not found — skipping vulnerability scan.'
                    }
                }
            }
        }

        stage('Docker Compose Deploy') {
            steps {
                echo 'Deploying using Docker Compose...'
                bat 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            deleteDir()
        }
    }
}
