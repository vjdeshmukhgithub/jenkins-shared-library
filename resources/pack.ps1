& "C:\Program Files (x86)\UiPath\Studio\UiRobot.exe" -pack "$env:WORKSPACE\project.json" --output "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER"
#cd 'C:\Program Files (x86)\UiPath\Studio'
#START UiRobot.exe -ArgumentList @("pack", "$env:WORKSPACE\project.json", "--output", "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER") 
#$wkspace = $env:WORKSPACE
#$jenkhome = $env:JENKINS_HOME
#$jbname = $env:JOB_NAME
#$bldnum = $env:BUILD_NUMBER
#$out = "$jenkhome\jobs\$jbname\builds\$bldnum"
#$proj = "$wkspace\project.json"

#START UiRobot.exe -ArgumentList @("pack", $proj, "--output", $out)