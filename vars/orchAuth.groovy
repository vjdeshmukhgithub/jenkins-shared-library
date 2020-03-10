def call(Map stageParams) {
    def psscript = libraryResource 'orchAuth.ps1'

    psCall = powershell returnStatus: true, script: psscript '$ORCH_USER', '$ORCH_PASS'
}