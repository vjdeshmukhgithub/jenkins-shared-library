$auth = @{
    tenancyName = 'VerticalApps'
    usernameOrEmailAddress = 'admin'
    password = 'myOrchestratorVapps11'
 }
 $authjson = $auth | ConvertTo-Json
 $authkey = Invoke-RestMethod -SkipCertificateCheck 'https://uipath.verticalapps.com/api/Account/Authenticate' -Method Post -Body $authjson -ContentType 'application/json'
 $authjson = $authkey | ConvertTo-Json
 $token = $authjson | ConvertFrom-Json -AsHashtable
 return $token.result

Write-Host "If the scan result from sonarqube passes the quality gate move the package. If not fail the build"