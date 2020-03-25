def call(String ORCH_USER, String ORCH_PASS) {
    def psscript = libraryResource 'orchAuth.ps1'

    psCall = powershell returnStatus: true, script: psscript
    println psCall
}