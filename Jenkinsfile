pipeline {
    agent {
        node {
        label 'AGENT-1'
        }
    }

    environment {
        COURSE = 'Jenkins'
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }

    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Mohan Vamsi Ravada', description: 'How are you')
    }

    stages{ 
        stage('Show Workspace') {
            steps {
                sh 'pwd && ls -l'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh """
                        echo "Hello Build..."
                        sleep 10
                        env
                        echo "Hello ${params.PERSON}"
                    """
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh """
                        echo "Hello Testing..."
                        env
                    """
                }
            }
        }
        stage('Deploy') {
            input {
                messgae "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Mohan Vamsi Ravada', description: 'How are you')
                }
            }
            steps {
                script {
                    sh """
                        echo "Hello Deploying..."
                        env
                        echo "Hello, ${PERSON}, nice to meet you."
                    """
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

