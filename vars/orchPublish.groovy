def call() {
    def psscript = libraryResource 'orchPublish.ps1'

    psCall = pwsh returnStatus: true, script: psscript
    println psCall
}