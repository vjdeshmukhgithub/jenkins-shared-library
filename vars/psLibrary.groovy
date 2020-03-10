def psScriptCall(){
    def psscript = libraryResource 'yolo.ps1'
    powershell psscript
}