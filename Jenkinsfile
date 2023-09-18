pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Security Scan with Grype') {
            steps {
                script {
                    sh "grype --version"  // Grype sürümünü kontrol etmek için

                    def scanResults = sh(script: "grype -o json .", returnStdout: true).trim()
                    writeFile file: 'grype-results.json', text: scanResults
                }
            }
        }

        stage('Publish Grype Results') {
            steps {
                script {
                    def vulnerabilities = readJSON file: 'grype-results.json'

                    if (vulnerabilities) {
                        echo "Güvenlik açıkları bulundu!"
                        echo vulnerabilities.toString()
                    } else {
                        echo 'Güvenlik açığı bulunamadı.'
                    }
                }
            }
        }
    }
}
