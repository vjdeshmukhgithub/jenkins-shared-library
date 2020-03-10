def call() {
    def psscript = libraryResource 'packageTransfer.ps1'
    psCall = powershell returnStatus: true, script: psscript
}