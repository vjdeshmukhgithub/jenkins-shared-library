def call() {
    def psscript = libraryResource 'yolo.ps1'
    psCall = pwsh returnStatus: true, script: psscript
}