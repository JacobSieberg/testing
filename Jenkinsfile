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
        sh 'cd build && cmake .. -DSETUP=clang'
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
        parallel(
          "test1": {
            sh '## make tests'
            sh '## run tests'
          },
          "test2": {
            sh '## make tests'
            sh '## run tests'
          },
          "test3": {
            sh '## make tests'
            sh '## run tests'
          }
        )
      }
    }
    stage('Package')
    {
      steps {
        parallel(
          "deb": {
            sh "chmod +x package-scripts/package.sh"
            sh 'package-scripts/package.sh $GIT_LOCAL_BRANCH $BUILD_NUMBER clang++-3.9'
            
          },
          "legato": {
            sh "chmod +x package-scripts/bundle.sh"
            sh 'package-scripts/bundle.sh $GIT_LOCAL_BRANCH $BUILD_NUMBER arm-poky-linux-gnueabi-g++'
          }
        )
      }
    }
  }
}