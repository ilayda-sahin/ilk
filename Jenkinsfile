pipeline {
    agent any

    environment {
        SONARQUBE_HOME = tool name: 'scanner', type: 'hudson.plugins.sonar.MsBuildSQRunnerInstallation'
        // SonarQube sunucu bilgileri
        SONARQUBE_SERVER = 'http://20.127.193.12:9000'
        SONARQUBE_PROJECT_KEY = 'yeni'
        SONARQUBE_PROJECT_NAME = 'yeni'
        SONARQUBE_PROJECT_VERSION = '1.0'
        SONARQUBE_SERVER_USERTOKEN = credentials('sqp_7f611f51c128f2f418a42eb857ca43bbda5dffef')
    }

    stages {
        stage('Checkout') {
            steps {
                // Kodu proje kök dizinine çıkar
                checkout scm
            }
        }

        stage('Build and Analyze') {
            steps {
                script {
                    def scannerHome = tool name: 'scanner', type: 'hudson.plugins.sonar.MsBuildSQRunnerInstallation'
                    def scannerCmd = "${scannerHome}/bin/sonar-scanner"

                    sh """
                        ${scannerCmd} -Dsonar.projectKey=${yeni} \
                                      -Dsonar.projectName='${yeni}' \
                                      -Dsonar.projectVersion=${1.0} \
                                      -Dsonar.host.url=${http://20.127.193.12:9000} \
                                      -Dsonar.login=${sqp_7f611f51c128f2f418a42eb857ca43bbda5dffef}
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
        failure {
            script {
                // Tarama başarısız olduğunda yapılacak işlemler
                echo "SonarQube scan failed. Check the logs for details."
            }
        }
    }
}
