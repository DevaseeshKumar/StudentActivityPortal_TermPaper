pipeline {
    agent any

    stages {
        stage('Dependency-Check') {
            steps {
                echo 'Running OWASP Dependency-Check...'
                bat """
                    mvn org.owasp:dependency-check-maven:check ^
                        -Dformat=ALL ^
                        -DoutputDirectory=dependency-check-report
                """
            }
        }

        stage('Supply Chain Attack Checks') {
            steps {
                script {
                    // Check if Cosign exists on this machine
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

        stage('Run Tests') {
            steps {
                echo 'Running unit tests...'
                bat 'mvn test'
            }
        }

        stage('Trivy Scan') {
            steps {
                echo 'Running Trivy vulnerability scan...'
                bat 'trivy image my-docker-image:latest'
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
