def call() {
    def psscript = libraryResource 'pack.ps1'
    psCall = pwsh script: psscript
}