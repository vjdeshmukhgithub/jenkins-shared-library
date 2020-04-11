def call(String tenant) {
    withCredentials([usernamePassword( credentialsId: 'orchestrator-authentication', 
                     usernameVariable: 'user', passwordVariable: 'pwd' )])

    def psscript = libraryResource 'orchPublish.ps1 $tenant $user $pwd https://uipath.verticalapps.com'

    psCall = pwsh returnStdout: true, script: psscript
    println psCall
}