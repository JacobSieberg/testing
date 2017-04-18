pipeline {
  agent any
  stages {
    stage('Setup CMAKE') {
      steps {
        sh 'cd build && cmake .. -DSETUP=clang'
      }
    }
    stage('Static Analysis') {
      steps {
        parallel(
          "clang-tidy": {
            sh 'cd build && make tidy'
            
          },
          "cppcheck": {
            sh 'cd build && make check'
            
          }
        )
      }
    }
    stage('Build CLang++') {
      steps {
        echo 'Building using clang++'
        sh 'cd build && cmake .. -DSETUP-clang'
        sh 'cd build && make'
      }
    }
    stage('Build g++') {
      steps {
        echo 'Building using g++'
        sh 'cd build && cmake .. -DSETUP=gcc'
        sh 'cd build && make'
      }
    }
    stage('Test') {
      steps {
        echo 'Test This is a new branch'
      }
    }
    stage('Deploy') {
      when {
        expression {
          return env.BRANCH_NAME == "master"
        }
        
      }
      steps {
        echo 'deploy'
      }
    }
  }
}