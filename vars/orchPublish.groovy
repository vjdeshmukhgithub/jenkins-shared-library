def call() {
    def psscript = libraryResource 'orchPublish.ps1'

    psCall = powershell returnStatus: true, script: psscript

    if(status != 0) { powershell ("Write-Error \"Ooops, an error occured\"") }
}