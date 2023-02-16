folder('/Whanos base images') {
    description('Base images for Whanos')
}
job('/Whanos base images/whanos-c') {
    steps {
        shell('docker build -t whanos-c ./whanos-c/')
    }
}

job('/Whanos base images/whanos-java') {
    steps {
        shell('docker build -t whanos-java ./whanos-java/')
    }
}

job('/Whanos base images/whanos-javascript') {
    steps {
        shell('docker build -t whanos-javascript ./whanos-javascript/')
    }
}

job('/Whanos base images/whanos-python') {
    steps {
        shell('docker build -t whanos-python ./whanos-python/')
    }
}

job('/Whanos base images/whanos-befunge') {
    steps {
        shell('docker build -t whanos-befunge ./whanos-befunge/')
    }
}

job('/Whanos base images/whanos-go') {
    steps {
        shell('docker build -t whanos-go ./whanos-go/')
    }
}

job('/Whanos base images/Build all base images') {
    steps {
        build job: '/Whanos base images/whanos-c', wait: true
        build job: '/Whanos base images/whanos-java', wait: true
        build job: '/Whanos base images/whanos-javascript', wait: true
        build job: '/Whanos base images/whanos-python', wait: true
        build job: '/Whanos base images/whanos-befunge', wait: true
        build job: '/Whanos base images/whanos-go', wait: true
    }
}
