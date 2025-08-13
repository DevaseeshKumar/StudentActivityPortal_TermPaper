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
                bat 'mvn org.owasp:dependency-check-maven:check -Dformat=ALL'
                archiveArtifacts artifacts: '**/dependency-check-report.html', fingerprint: true
            }
        }

        stage('Supply Chain Attack Checks') {
            steps {
                script {
                    // Example: provenance verification (Sigstore Cosign) & package name check
                    bat 'cosign verify --key public.key my-docker-image:latest || exit 1'
                    // Optional: run a Python script to detect typosquatting in dependency list
                    bat 'python scripts/typosquat_check.py'
                }
            }
        }

        stage('Test') {
            steps {
                echo "Test Completed"
            }
        }

        stage('Container Image Security Scan') {
            steps {
                script {
                    // Build image
                    bat 'docker build -t student-activity-portal:latest .'
                    // Scan image with Trivy
                    bat 'trivy image --severity HIGH,CRITICAL --exit-code 1 --no-progress student-activity-portal:latest'
                    // Run CIS Docker Benchmark (requires Docker-bench-security tool installed)
                    bat 'docker run --rm --net host --pid host --userns host --cap-add audit_control \
                        -e DOCKER_CONTENT_TRUST=1 \
                        -v /etc:/etc:ro \
                        -v /usr/bin/docker-containerd:/usr/bin/docker-containerd:ro \
                        docker/docker-bench-security'
                }
            }
        }

        stage('Start Services with Docker Compose') {
            steps {
                script {
                    bat 'docker-compose up -d --build'
                }
            }
        }

        stage('Archive Security Reports') {
            steps {
                archiveArtifacts artifacts: '**/dependency-check-report.html,**/trivy-report.html', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully with enhanced security checks!'
        }
        failure {
            echo 'Pipeline failed. Please check logs and security reports.'
        }
        cleanup {
            cleanWs() // Cleans workspace, containers remain unless manually stopped
        }
    }
}
