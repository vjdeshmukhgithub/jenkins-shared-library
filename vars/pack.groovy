def call() {
    def psscript = libraryResource 'pack.ps1'
    psCall = powershell returnStatus: true, script: psscript
}