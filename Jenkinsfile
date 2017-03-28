node {
    parallel
        stage 'Build clang++'
            echo "Building..."
            sh 'cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++'
            sh 'cd build && make'
            echo "Build Complete."
        stage 'Build g++'
            echo 'Building...'
            sh 'cd build && cmake .. -DCMAKE_CXX_COMPILER=g++'
            sh 'cd build && make'
            echo "Build Complete."
    stage 'Test'
        echo "Testing"
    stage 'Deploy'
        echo "Deploying"
}
