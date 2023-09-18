pipeline {
    agent any // Herhangi bir Jenkins ajanında çalıştırılabilir

    stages {
        stage('Hazırlık') {
            steps {
                // Node.js ve npm'i yükle
                sh 'curl -sL https://deb.nodesource.com/setup_14.x | bash -'
                sh 'apt-get install -y nodejs'

                // Yarn'ı yükle (isteğe bağlı)
                sh 'npm install -g yarn'
            }
        }

        stage('Kod Al') {
            steps {
                // Proje repoyu al
                checkout scm
            }
        }

        stage('Bağımlılıkları Yükle') {
            steps {
                // Bağımlılıkları yükle (örneğin, npm veya yarn kullanabilirsiniz)
                sh 'npm install'
            }
        }

        stage('Testleri Çalıştır') {
            steps {
                // Testleri çalıştır (örneğin, npm test veya yarn test kullanabilirsiniz)
                sh 'npm test'
            }
        }

        stage('Kod Taraması') {
            steps {
                // SonarQube ile kod taraması yap
                withSonarQubeEnv('sonarqube') {
                    sh 'canner' // SonarQube Scanner'ı projenizin gereksinimlerine göre yapılandırın
                }
            }
        }
    }

    post {
        failure {
            // Kod taraması veya testler başarısızsa ne yapılacağını burada belirleyebilirsiniz
        }
    }
}
