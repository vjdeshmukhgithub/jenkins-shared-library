def call(Map stageParams){
    powershell([
        returnStatus: true, 
        script: 'Write-Host \'Live for today, YOLO!!!\''
    ])
}