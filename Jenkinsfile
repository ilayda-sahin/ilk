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
                // Grype ile güvenlik taraması yapın (projenizin dizinini ayarlayın)
                sh 'grype -r .'
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
