pipeline {
    agent any
    stages {
        stage("Setup CMAKE for SA checks")
        {
            steps{
                sh "cd build && cmake .."
            }
        }
        stage("check")
        {
            steps{
                echo "Running 'clang-tidy'"
                sh "cd build && make check"
            }
        }
        stage("Tidy")
        {
            steps{
                echo "Running 'clang-tidy'"
                sh "cd build && make tidy"
            }
        }
        stage("Build CLang++")
        {
            steps{
                echo "Building using clang++"
                sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++"
                sh "cd build && make"
            }
        }
        stage("Build g++")
        {
            steps{
                echo "Building using g++"
                sh "cd build && cmake .. -DCMAKE_CXX_COMPILER=g++"
                sh "cd build && make"
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
