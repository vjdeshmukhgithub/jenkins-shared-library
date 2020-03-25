def call() {
    def psscript = libraryResource 'pack.ps1'
    psCall = powershell script: psscript
}