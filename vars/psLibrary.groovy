def call() {
    def psscript = libraryResource 'yolo.ps1'
    psCall = powershell returnStatus: true, script: psscript
}