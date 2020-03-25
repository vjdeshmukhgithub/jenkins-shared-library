def call() {
    //def psscript = libraryResource 'pack.ps1'
    //psCall = powershell script: psscript
    sh(script:"\"C:\Program Files (x86)\UiPath\Studio\UiRobot.exe\" pack \"$env:WORKSPACE\project.json\" -o \"$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER\"")
}