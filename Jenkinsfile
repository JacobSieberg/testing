node {
    parallel(
        "Build with Clang++":{
            echo "Building..."
            sh 'cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++'
            sh 'cd build && make'
            echo "Build Complete."
        }
        "Build with g++":{
            echo "Building..."
            sh 'cd build && cmake .. -DCMAKE_CXX_COMPILER=clang++'
            sh 'cd build && make'
            echo "Build Complete."
        }
    )
    stage 'Test'
        echo "Testing"
    stage 'Deploy'
        echo "Deploying"
}
