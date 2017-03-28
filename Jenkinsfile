pipeline {
    agent any
    stages {
        stage("Build")
        {
            parallel:(
                "A":
                    steps {
                        echo "Build"
                }
                "B":
                    steps {
                        echo "Build"
                }
            )
        }
        stage("Test")
        {
            steps{
                echo "Test"
            }
        }
    }    
}
