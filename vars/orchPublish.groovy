def call() {
    def psscript = libraryResource 'orchPublish.ps1'

    psCall = powershell returnStatus: true, script: psscript()
}