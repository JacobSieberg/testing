node {
    stage 'Build'
        echo "Building..."
        sh 'cd build && cmake ..'
        sh 'cd build && make'
        echo "Build Complete."
    stage 'Test'
        echo "Testing"
    stage 'Deploy'
        echo "Deploying"
}
