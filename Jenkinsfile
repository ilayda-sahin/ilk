pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Grype Scan') {
            steps {
                script {
                    sh 'grype -v .'
                }
            }
        }
    }
}
