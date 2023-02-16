folder('/Whanos base images') {
    description('Base images for Whanos')
}

available_languages = ['c', 'java', 'javascript', 'python', 'befunge', 'go']

for (language in available_languages) {
    job("/Whanos base images/whanos-${language}") {
        steps {
            shell("docker build /images/${language} -t whanos-${language} -f /images/${language}/whanos-${language}/Dockerfile.base")
        }
    }
}

freeStyleJob('/Whanos base images/Build all base images') {
    publishers {
        downstream(available_languages.collect { language -> "Whanos base images/whanos-$language" })
	}
}