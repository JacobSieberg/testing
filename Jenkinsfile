pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sudo mkdir testbuild
                cd testbuild
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
