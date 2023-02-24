folder('/Whanos base images') {
    description('Base images for Whanos')
}

available_languages = ['c', 'java', 'javascript', 'python', 'befunge', 'go']

for (language in available_languages) {
    job("/Whanos base images/whanos-${language}") {
        steps {
            shell("docker login -u _json_key --password-stdin https://eu.gcr.io < ${JENKINS_HOME}/whanos_gcp_creds.json")
            shell("""
                docker build ${JENKINS_HOME}/images/${language} -t eu.gcr.io/nomadic-mesh-376709/whanos-${language} -f ${JENKINS_HOME}/images/${language}/Dockerfile.base
                docker push eu.gcr.io/nomadic-mesh-376709/whanos-${language}
            """.stripIndent())
        }
    }
}

freeStyleJob('/Whanos base images/Build all base images') {
    publishers {
        downstream(available_languages.collect { language -> "Whanos base images/whanos-$language" })
	}
}