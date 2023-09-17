pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'npm install' // Node.js projeniz için bağımlılıkları yükleyin
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Your_SonarQube_Environment_Name') {
                    sh 'npm run sonar-scanner' // Projenize uygun analiz komutunu kullanın
                }
            }
        }
    }
}
