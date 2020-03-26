#"& 'C:\Program Files (x86)\UiPath\Studio\UiRobot.exe' pack '$env:WORKSPACE\project.json' -o '$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER'";
$pwshScriptBlock = @'
& "C:\Program Files (x86)\UiPath\Studio\UiRobot.exe" pack "$env:WORKSPACE\project.json" -o "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER"" *> script.log
'@;
$FilePath = "C:\Program Files\PowerShell\7\pwsh.exe"
$ArgumentList ='-noprofile -nologo - NonInteractive -w hidden -command "& {' + $pwshScriptBlock + '}"';
$Process = Start-Process -FilePath $FilePath -ArgumentList $ArgumentList -PassThru;