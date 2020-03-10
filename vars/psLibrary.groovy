def call() {
    def psscript = libraryResource 'resources\'yolo.ps1'
    psCall = powershell returnStatus: true, script: psscript
}