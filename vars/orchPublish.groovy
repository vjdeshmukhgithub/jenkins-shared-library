def call() {
    def psscript = libraryResource 'orchPublish.ps1'

    psCall = pwsh returnStdout: true, script: psscript
    println psCall
}