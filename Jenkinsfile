pipeline {
    agent any // Herhangi bir Jenkins ajanında çalıştırılabilir

    environment {
        // Node.js'yi yüklemek için kullanılan Node Version Manager (nvm) ile ilgili ortam değişkenleri
        NVM_DIR = tool 'NodeJS'
        PATH = "${NVM_DIR}/current/bin:${env.PATH}"
    }

    stages {
        stage('Hazırlık') {
            steps {
                // Node.js ve npm'i yükle
                script {
                    def nodeVersion = '14.17.6' // Kullanmak istediğiniz Node.js sürümünü belirtin
                    def npmVersion = '6.14.15' // Kullanmak istediğiniz npm sürümünü belirtin

                    def home = tool name: 'NodeJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                    def installer = getTool home
                    installer.getNodeJSInstaller().install(env, launcher)
                    installer.getNpmInstaller().install(env, launcher)
                }
            }
        }

        stage('Kod Taraması') {
            steps {
                // Projeyi al ve gerekli bağımlılıkları yükle
                checkout scm
                sh 'npm install'

                // SonarQube kod taraması yap
                withSonarQubeEnv('SonarQube1') {
                    sh 'npm run sonar' // Projede tanımladığınız komutu kullanın
                }
            }
        }
    }
}
