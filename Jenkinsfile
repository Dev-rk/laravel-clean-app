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
                sh "echo 'hello' > test.txt"

                script {
                    dockerImage = docker.build(registry + ":${tagName}", " --no-cache .")
                    dockerImage.inside {
                        sh 'ls -la'
                    }
//                     dockerImage.run {
//                         sh 'ls -la'
//                     }

//                     dockerImage.withRun {
//                         sh 'ls -la'
//                     }
//                     sh 'docker ps -a'
//                     sh 'docker images'
                }

            }
        }

        stage('Run PHP tests') {
            steps {
                script {
//                     docker.image(registry + ":${tagName}").inside {
                        sh 'ls -la'
//                     }
//                 withDockerContainer(registry + ":${tagName}") {
//                     sh 'ls -la'
//                 }
//                     dockerImage.inside {
//                         sh 'pwd'
//                         sh 'ls -la'
//                         sh './vendor/bin/phpunit'
//                     }
                }
            }
        }

//         stage('Publish') {
//             steps {
//                 script {
//                     echo "docker.withRegistry"
//                     docker.withRegistry('', registryCredential) {
//                         dockerImage.push()
//                     }
//                 }
//             }
//         }
//
//         stage('Publish latest') {
//             when {
//                 environment name: 'tagName', value: 'master'
//             }
//
//             steps {
//                 script {
//                     echo "docker.withRegistry"
//                     docker.withRegistry('', registryCredential) {
//                         dockerImage.push("latest")
//                   }
//                 }
//           }
//         }
    }
}
