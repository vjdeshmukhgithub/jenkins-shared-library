def call(String builddir) {
    withCredentials([usernamePassword( credentialsId: 'orchestrator-authentication', 
                     usernameVariable: 'user', passwordVariable: 'pwd' )])

    def psscript = libraryResource 'orchPublish.ps1 VerticalApps $user $pwd https://uipath.verticalapps.com $builddir'

    psCall = pwsh returnStdout: true, script: psscript
    println psCall
}