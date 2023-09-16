pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Proje kodunu al
                checkout scm
            }
        }

        stage('Grype Scan') {
            steps {
                script {
                    // Grype'ı çalıştır ve sonuçları bir dosyaya kaydet
                    def grypeResult = sh(script: 'grype -o grype-report.json .', returnStatus: true)

                    // Grype taraması başarılı bir şekilde tamamlandı mı kontrol et
                    if (grypeResult == 0) {
                        echo "Grype taraması başarılı bir şekilde tamamlandı."
                    } else {
                        error "Grype taraması başarısız oldu. Hata kodu: ${grypeResult}"
                    }
                }
            }
        }
    }

    post {
        always {
            // Grype taraması sonuçlarını kaydet ve görüntüle
            archiveArtifacts artifacts: 'grype-report.json', allowEmptyArchive: true
            junit 'grype-report.json'
        }
    }
}
