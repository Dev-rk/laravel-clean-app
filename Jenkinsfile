pipeline {
    agent { dockerfile true }
    stages {
        stage('Build and test') {
            steps {
                sh 'pwd | ls -la'
                sh 'composer install'
                sh '/opt/service/vendor/bin/phpunit'
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
