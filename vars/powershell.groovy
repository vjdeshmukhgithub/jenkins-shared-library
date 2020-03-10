def call(Map stageParams){
    powershell([
        returnStatus: true, 
        [[script: stageParams.ps1]]
    ])
}