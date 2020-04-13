def call() {
    def psscript = libraryResource 'gitCheckin.ps1'
    psCall = powershell returnStdout: true, script: psscript
}