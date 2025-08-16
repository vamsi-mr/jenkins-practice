pipeline {
    agent {
        node {
        label 'AGENT-1'
        }
    }

    environment {
        COURSE = 'Jenkins'
    }

    stages{
        stage('Build') {
            steps {
                script {
                    sh """
                        echo "Hello Build"
                        env
                    """
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Testing...'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying...'
                }
            }
        }
    }

    post {
        always {
            echo 'I will always says Hello again!'
            deleteDir()
        }
        success {
            echo 'Hello Success'
        }
        failure {
            echo 'Hello Failure'
        }
    }
}