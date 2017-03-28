pipeline {
    agent any
    stages {
        stage("Build")
        {
            steps{
                parallel (
                    "A":
                    {
                        echo "Build A"
                    },
                    "B":
                    {
                        echo "Build B"
                    }
                )
            }
        }
        stage("Test")
        {
            steps{
                echo "Test"
            }
        }
    }    
}
