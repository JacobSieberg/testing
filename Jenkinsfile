node {
    stage 'Build'
        echo "Building"
        sh 'mkdir build'
        sh 'cd build'
        sh 'cmake ..'
        sh 'make'
    stage 'Test'
        echo "Testing"
    stage 'Deploy'
        echo "Deploying"
}
