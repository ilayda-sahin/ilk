pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Kod deposundan kodu çek
                checkout scm
            }
        }

        stage('Install Grype') {
            steps {
                // Grype'ı kurmak için gerekli adımlar
                sh 'curl -sSfL https://get.grype.io | sudo sh'
            }
        }

        stage('Scan for Vulnerabilities') {
            steps {
                script {
                def grypeOutput = sh(script: 'grype -r .', returnStatus: true)
                if (grypeOutput != 0) {
                error "Grype taraması başarısız oldu. Hata kodu: ${grypeOutput}"
            }       
        }
    }
}

    }

    post {
        always {
            // Tarama sonuçlarını kaydetmek için gerekli adımlar
            archiveArtifacts artifacts: 'grype-results.json', allowEmptyArchive: true
        }
    }
}
