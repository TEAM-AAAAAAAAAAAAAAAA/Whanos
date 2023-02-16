job('/link-project') {
    parameters{
        stringParam('GIT_URL', null, 'Git URL')
        stringParam('DISPLAY_NAME', null, 'Display Name')
    }
    steps {
        dsl('''
job("/$DISPLAY_NAME") {
    scm {
        git {
            remote {
                name('origin')
                url("$GIT_URL")
            }
        }
    }
    triggers {
        scm('* * * * *')
    }
    wrappers {
        preBuildCleanup()
    }
    steps {
        // Find the language of the project
        // Check if the project has changed
        // If the project has changed, deploy the project on a kubernetes cluster
        shell('echo "Hello World"')
    }
}'''.stripIndent())
    }
}