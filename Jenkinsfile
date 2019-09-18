pipeline {
    agent any

    environment {
        registry = 'testlaravelapp/laravel'
        registryCredential = 'dockerhub'

        BRANCH_TO_BUILD = "${params.BRANCH_TO_BUILD}"
        BRANCH_NAME = "${GIT_BRANCH}"
        dockerImage = ''
    }

    stages {
        stage('Build Docker') {
          steps {
                echo "${BRANCH_TO_BUILD}"
                echo "${BRANCH_NAME}"
                echo "${registry}:${BRANCH_NAME}"
                script {
                    dockerImage = docker.build registry + ":${BRANCH_NAME}"
                }
            }
        }

        stage('Run PHP tests') {
            steps {
                echo "current build number: ${currentBuild.number}"
                echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
                echo "${GIT_BRANCH}"

                script {
                    dockerImage.inside {
                        sh './vendor/bin/phpunit'
                    }
                }
            }
        }

        stage('Publish') {
              when {
                branch 'origin/master'
              }

              steps {
                script {
                    docker.withRegistry('', registryCredential) {
                    dockerImage.push()
                  }
                }
              }
            }
    }
}
