pipeline {
    agent any

    environment {
        registry = 'testlaravelapp/laravel'
        registryCredential = 'dockerhub'

        BRANCH_NAME = "${GIT_BRANCH}"

        tagName = BRANCH_NAME.substring(BRANCH_NAME.lastIndexOf('/') + 1, BRANCH_NAME.length())
        dockerImage = ''
    }

    stages {
        stage('Build Docker') {
          steps {
                echo "${tagName}"

                script {
                    dockerImage = docker.build registry + ":${tagName}"
                }
            }
        }

        stage('Run PHP tests') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'pwd'
                        sh 'ls -la'
                        sh './vendor/bin/phpunit'
                    }
                }
            }
        }

        stage('Publish') {
            steps {
                script {
                    echo "docker.withRegistry"
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Publish latest') {
            when {
                environment name: 'tagName', value: 'master'
            }

            steps {
                script {
                    echo "docker.withRegistry"
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push("latest")
                  }
                }
          }
        }
    }
}
