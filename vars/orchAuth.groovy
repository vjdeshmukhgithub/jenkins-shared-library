def call(String ORCH_USER, String ORCH_PASS) {
    def psscript = libraryResource 'orchAuth.ps1'

    psCall = powershell(returnStdout: true, script: psscript)
    echo psCall
}