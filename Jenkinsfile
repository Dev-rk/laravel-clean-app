pipeline {
    agent any

    environment {
        registry = 'testlaravelapp/laravel'
        registryCredential = 'dockerhub'

        BRANCH_NAME = "${GIT_BRANCH}"
        tagName = GIT_BRANCH.substring(GIT_BRANCH.lastIndexOf('/') + 1, GIT_BRANCH.length())

        dockerImage = ''
    }

    stages {
        stage('Build Docker') {
          steps {
                script {
                    dockerImage = docker.build(registry + ":${tagName}", " --no-cache .")
                }
            }
        }

        stage('Run PHP tests') {
            steps {
                sh "docker run -i ${registry}:${tagName} ./vendor/bin/phpunit"
                /* use in case of using outside of Jenkins-dockerImage
                script {
                    dockerImage.inside {
                        sh './vendor/bin/phpunit'
                    }
                }
                */
            }
        }

        stage('Publish') {
            steps {
                script {
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
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push("latest")
                  }
                }
          }
        }
    }
}
