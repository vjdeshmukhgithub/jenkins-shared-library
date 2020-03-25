$auth = @{
   tenancyName = 'VerticalApps'
   usernameOrEmailAddress = 'admin'
   password = 'myOrchestratorVapps11'
}
$authjson = $auth | ConvertTo-Json
$authkey = Invoke-RestMethod -SkipCertificateCheck 'https://uipath.verticalapps.com/api/Account/Authenticate' -Method Post -Body $authjson -ContentType 'application/json'
$authjson = $authkey | ConvertTo-Json
$token = $authjson | ConvertFrom-Json -AsHashtable
Write-Output $token
Invoke-RestMethod -SkipCertificateCheck 'https://uipath.verticalapps.com/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage' -Method Post -Authentication Bearer -Token $token.result -InFile 'C:\\Program Files (x86)\\Jenkins\\workspace\\test-shared-library@tmp\\Output\\Test.1.0.7.nupkg'
# //curl -XPOST --insecure -v -H 'Authorization: Bearer $token' '-F file=@C:\\Program Files (x86)\\Jenkins\\workspace\\test-shared-library@tmp\\Output\\Test.1.0.7.nupkg' 'https://uipath.verticalapps.com/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage'
