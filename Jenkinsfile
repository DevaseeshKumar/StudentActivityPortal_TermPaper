pipeline {
    agent any

    environment {
        TRIVY_SEVERITY = 'CRITICAL,HIGH'
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
                bat 'mvn org.owasp:dependency-check-maven:check -Dformat=ALL'
                archiveArtifacts artifacts: '**/dependency-check-report.html', fingerprint: true
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t student-portal:latest .'
            }
        }

        stage('Container Image Scan - Trivy') {
            steps {
                bat 'trivy image --severity %TRIVY_SEVERITY% --no-progress --exit-code 0 student-portal:latest > trivy-report.txt'
                archiveArtifacts artifacts: 'trivy-report.txt', fingerprint: true
            }
        }

        stage('Start Services with Docker Compose') {
            steps {
                bat 'docker-compose up -d --build'
                // Wait for app to be ready (simulate wait)
                bat 'ping -n 30 127.0.0.1 > nul'
            }
        }

        stage('Dynamic Security Testing - OWASP ZAP') {
    steps {
        bat '''
        docker pull ghcr.io/zaproxy/zap-baseline
        docker run --rm -v %cd%:/zap/wrk:rw --network=host ghcr.io/zaproxy/zap-baseline -t http://host.docker.internal:1127 -r zap-report.html || exit 0
        '''
        archiveArtifacts artifacts: 'zap-report.html', fingerprint: true
    }
}

    }

    post {
        success {
            echo '✅ DevSecOps pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Please check the logs.'
        }
        cleanup {
            cleanWs()
        }
    }
}
