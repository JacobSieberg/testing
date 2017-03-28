pipeline {
    agent any
    stages {
        stage("Build")
        {
            steps{
                parallel (
                    "clang ++":
                    {
                        sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++"
                        sh "cd build && make"
                    },
                    "g++":
                    {
                        sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=g++"
                        sh "cd build && make"
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
        stage("Deploy")
        {
            steps{
                echo "deploy"
            }
        }
    }    
}
