pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                ls -a
                mkdir testbuild && cd testbuild
                cmake ..
                make
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
