folder('/Projects') {
    description('Projects linked by the link-project job')
}

job('/link-project') {
    parameters{
        stringParam('GIT_URL', null, 'Git URL')
        stringParam('DISPLAY_NAME', null, 'Display Name')
        credentialsParam('CREDENTIAL') {
            type('com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey')
            description('SSH key to clone repository')
        }
    }
    steps {
        dsl('''
job("/Projects/$DISPLAY_NAME") {
    scm {
        git {
            remote {
                name('origin')
                url("$GIT_URL")
                credentials("$CREDENTIAL")
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
        shell('/var/lib/jenkins/jobs/scripts/detect-language.sh')
    }
}'''.stripIndent())
    }
}