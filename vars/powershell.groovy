def call(Map stageParams){
    powershell([
        powershell label: '', 
        returnStatus: true, 
        script: stageParams.ps1
    ])
}