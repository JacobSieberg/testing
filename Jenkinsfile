pipeline {
    agent any
    stages {
        stage("Build")
        {
            steps{
                parallel (
                    "clang ++":
                    {
                        echo "Building using clang++"
                        sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++"
                        sh "cd build && make"
                    },
                    //"g++":
                    //{
                    //    echo "Building using g++"
                    //    sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=g++"
                    //    sh "cd build && make"
                    //}
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
