pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // GitHub reposunun kodunu bu adımda alın
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'your-github-credentials', url: 'https://github.com/yourusername/your-repo.git']]])
            }
        }
        
        stage('Build') {
            steps {
                // Projeyi derleme komutları burada olur
                sh 'make build' // Örnek bir derleme komutu
            }
        }
        
        stage('SonarQube Scan') {
            steps {
                script {
                    def scannerHome = tool name: 'SonarQube Scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    def scannerCmd = "${scannerHome}/bin/sonar-scanner"
                    sh """
                        ${scannerCmd} -Dsonar.host.url=http://sonarqube_server_url:9000 -Dsonar.login=your-sonar-token -Dsonar.projectKey=your-project-key
                    """
                }
            }
        }
        
        stage('Test') {
            steps {
                // Test komutları burada olur
                sh 'make test' // Örnek bir test komutu
            }
        }
        
        stage('Deploy') {
            steps {
                // Uygulamayı dağıtma komutları burada olur
                sh 'make deploy' // Örnek bir dağıtım komutu
            }
        }
    }
    
    post {
        success {
            // Başarılı bir şekilde tamamlandığında yapılacaklar
            // Örneğin bildirim gönderme
        }
        
        failure {
            // Başarısız olduğunda yapılacaklar
            // Örneğin hata bildirimi
        }
    }
}
