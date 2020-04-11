$auth = @{
   tenancyName = $args[0]
   usernameOrEmailAddress = $args[1]
   password = $args[2]
}

Write-Output "Beginning UIPath Orchestrator Authentication"
$authjson = $auth | ConvertTo-Json
$authkey = Invoke-RestMethod -SkipCertificateCheck "$($args[3])/api/Account/Authenticate" -Method Post -Body $authjson -ContentType 'application/json'
$authjson = $authkey | ConvertTo-Json
$token = $authjson | ConvertFrom-Json
Set-Variable -Name "ts" -Value $token.result
Write-Output "$ts"

$tokenstring = ConvertTo-SecureString $ts -AsPlainText -Force

Write-Output "Beginning UIPath Orchestrator publish"
 
$Directory = "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER"
$Package = Get-ChildItem -Path $Directory -Filter *.nupkg
$FilePath = $Directory + $Package.Name
$FieldName = $Package.Name.Replace(".nupkg","")
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

Invoke-RestMethod -SkipCertificateCheck -Body $MultipartContent "$($args[3])/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage" -Method Post -Authentication Bearer -Token ($tokenstring)
Write-Output "The package has been successfully published to Orchestrator and nexus"