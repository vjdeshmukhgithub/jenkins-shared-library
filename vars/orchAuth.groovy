def call('ORCH_USER, ORCH_PASS') {
    def psscript = libraryResource 'orchAuth.ps1'
    psCall = powershell returnStatus: true, script: psscript '$ORCH_USER, ORCH_PASS'
}