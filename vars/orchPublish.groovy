def call() {
    def psscript = libraryResource 'orchPublish.ps1'

    psCall = pwsh returnStatus: true, script: psscript

    if(psCall != 0) { echo("Write-Error \"Ooops, an error occured\"") }
}