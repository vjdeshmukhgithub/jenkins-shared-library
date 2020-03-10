def psScriptCall() {
    def psscript = libraryResource 'yolo.ps1'
    powershell returnStatus: true, script: psscript
}