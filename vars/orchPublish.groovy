def call(String tenant) {
    withEnv(['url=https://uipath.verticalapps.com', 'tenancy='+$tenant]) {
        withCredentials([usernamePassword( credentialsId: 'orchestrator-authentication', 
                        usernameVariable: 'user', passwordVariable: 'pwd' )]) {
            println "User: $user PWD: $pwd"

            def psscript = libraryResource 'orchPublish.ps1'

            psCall = pwsh returnStdout: true, script: psscript 
            println psCall           
        }
    }
}