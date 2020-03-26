$auth = @{
   tenancyName = 'VerticalApps'
   usernameOrEmailAddress = 'admin'
   password = 'myOrchestratorVapps11'
}
Write-Output "Beginning UIPath Orchestrator Authentication"
$authjson = $auth | ConvertTo-Json
$authkey = Invoke-RestMethod -SkipCertificateCheck 'https://uipath.verticalapps.com/api/Account/Authenticate' -Method Post -Body $authjson -ContentType 'application/json'
$authjson = $authkey | ConvertTo-Json
$token = $authjson | ConvertFrom-Json
Set-Variable -Name "ts" -Value $token.result
Write-Output "Authenticated and token recieved"

$tokenstring = ConvertTo-SecureString $ts -AsPlainText -Force

Write-Output "Beginning UIPath Orchestrator publish"

$FilePath = 'C:\Program Files (x86)\Jenkins\jobs\jlea-pipeline-test\builds\47\Test.1.0.10.nupkg'
$FieldName = 'Test.1.0.10'
$ContentType = 'multipart/form-data'

$FileStream = [System.IO.FileStream]::new($filePath, [System.IO.FileMode]::Open)
$FileHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new('form-data')
$FileHeader.Name = $FieldName
$FileHeader.FileName = Split-Path -leaf $FilePath
$FileContent = [System.Net.Http.StreamContent]::new($FileStream)
$FileContent.Headers.ContentDisposition = $FileHeader
$FileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse($ContentType)

$MultipartContent = [System.Net.Http.MultipartFormDataContent]::new()
$MultipartContent.Add($FileContent)

Invoke-RestMethod -SkipCertificateCheck -Body $MultipartContent 'https://uipath.verticalapps.com/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage' -Method Post -Authentication Bearer -Token ($tokenstring)
Write-Output "The package has been successfully published to Orchestrator and nexus"