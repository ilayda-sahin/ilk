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
                script {
                    try {
                        sh 'curl -sSfL https://get.grype.io | sudo sh'
                    } catch (Exception e) {
                        error "Grype kurulumu sırasında bir hata oluştu: ${e.message}"
                    }
                }
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
            script {
                try {
                    archiveArtifacts artifacts: 'grype-results.json', allowEmptyArchive: true
                } catch (Exception e) {
                    error "Tarama sonuçları arşivlenirken bir hata oluştu: ${e.message}"
                }
            }
        }
    }
}
