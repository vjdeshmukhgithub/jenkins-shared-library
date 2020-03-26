cd 'C:\Program Files (x86)\UiPath\Studio'
.\UiRobot.exe pack "$env:WORKSPACE\project.json" -o "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER"