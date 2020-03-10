def call(String ORCH_USER, String ORCH_PASS) {
    def psscript = libraryResource 'orchAuth.ps1 -ORCH_USER $ORCH_USER -ORCH_PASS $ORCH_PASS'

    psCall = powershell returnStatus: true, script: psscript
}