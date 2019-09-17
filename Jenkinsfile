pipeline {
    agent { dockerfile true }
    stages {
        stage('Build and test') {
            steps {
                sh 'pwd'
                sh 'pwd | ls -la'
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
