pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'echo "Building the project..."'
            }
        }
        
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'echo "Deploying the project..."'
            }
        }
    }
    
    post {
        success {
            echo 'The pipeline has succeeded!'
        }
        
        failure {
            echo 'The pipeline has failed. Please check the build logs.'
        }
    }
}
