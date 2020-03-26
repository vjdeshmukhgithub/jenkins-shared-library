def call() {
    def psscript = libraryResource 'pack.ps1'
    psCall = pwsh returnStdout: true, script: psscript
}