pipeline {
    agent { dockerfile true }
    stages {
        stage('Build and test') {
            steps {
                sh 'pwd'
                sh 'pwd | ls -la'
                sh './vendor/bin/phpunit'
            }
        }

        stage('test advance script') {
            steps {
                echo "current build number: ${currentBuild.number}"
                echo "previous build number: ${currentBuild.previousBuild.getNumber()}"
            }
        }
    }
}
