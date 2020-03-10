def psScriptCall() {
    def psscript = libraryResource 'yolo.ps1'
    psCall = powershell returnStatus: true, script: psscript
}

def psOutput() {
    psCall
}