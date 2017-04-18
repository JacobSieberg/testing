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
          "clang-format": {
            sh 'cd build && make format'
            
          },
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
    stage('Build legato') {
      steps {
        echo 'Building using legato toolchain'
        sh 'cd build && cmake .. -DSETUP=legato'
        sh 'cd build && make'
      }
    }
    stage('Test') {
      steps {
        sh '#/path/to/test/command1'
        sh '#/path/to/test/command2'
      }
    }
    stage('Package')
    {
      steps {
        parallel(
          "deb": {
            sh 'package-scripts/package.sh $GIT_LOCAL_BRANCH $BUILD_NUMBER clang++-3.9'
            
          },
          "legato": {
            sh 'package-scripts/bundle.sh $GIT_LOCAL_BRANCH $BUILD_NUMBER arm-poky-linux-gnueabi-g++'
          }
        )
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