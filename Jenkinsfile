pipeline {
    agent any

    environment {
        // SonarQube sunucusu yapılandırmaları
        SONARQUBE_SERVER = credentials('sonarqube') // Jenkins'te tanımlanan SonarQube sunucusunun kimlik doğrulama bilgileri
        SONARQUBE_PROJECT_KEY = 'yeni' // SonarQube'da tanımlanan projenin anahtarı
        SONARQUBE_PROJECT_NAME = 'yeni' // SonarQube'da tanımlanan projenin adı
        SONARQUBE_PROJECT_VERSION = '4.7.0.2747' // Proje sürümü
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Scan') {
            steps {
                script {
                    // SonarQube tarama işlemi
                    def scannerHome = tool name: 'SonarQube', type: 'hudson.plugins.sonar.MsBuildSQRunnerInstallation'
                    def scannerCmd = "${scannerHome}/bin/sonar-scanner"

                    sh """
                        ${scannerCmd} -Dsonar.projectKey=${SONARQUBE_PROJECT_KEY} \
                            -Dsonar.projectName='${SONARQUBE_PROJECT_NAME}' \
                            -Dsonar.projectVersion=${SONARQUBE_PROJECT_VERSION} \
                            -Dsonar.host.url=${SONARQUBE_SERVER} \
                            -Dsonar.login=${SONARQUBE_SERVER_USERTOKEN} \
                            -Dsonar.java.binaries=target/classes
                    """
                }
            }
        }
    }

    post {
        success {
            script {
                // Tarama başarılı olduğunda yapılacak işlemler
                echo "SonarQube scan completed successfully."
            }
        }
    }
}
