pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Kod deposundan projeyi çek
                checkout scm
            }
        }

        stage('Build and Scan') {
            steps {
                // Java projeyi derle (Maven kullanılacak varsayılan olarak)
                maven 'Maven'
                sh 'mvn clean install'

                // OWASP Dependency-Check ile tarama yap
                script {
                    def dependencyCheckCmd = """
                        dependency-check-cli 
                        --scan . 
                        --format HTML 
                        --project "My Java Project" 
                        --out .dependency-check-report
                    """
                    def scanResult = sh(script: dependencyCheckCmd, returnStatus: true)
                    
                    // Tarama başarılı ise devam et, değilse hata ver
                    if (scanResult == 0) {
                        echo 'Kod taraması başarılı!'
                    } else {
                        error 'Kod taraması başarısız!'
                    }
                }
            }
        }
    }

    post {
        always {
            // Her durumda tarama raporlarını arşivle ve temizle
            archiveArtifacts artifacts: '.dependency-check-report/*', allowEmptyArchive: true
        }
    }
}
