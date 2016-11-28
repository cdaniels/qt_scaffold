// checkout and build the qt scaffold
node {
    // checkout code from repo
    checkout scm
    // run the build script
    stage "Build from script"
    sh '''
        ant -Dplatforms.JDK_1.7.home=$JAVA_HOME jar;
    '''
}
