$auth = @{
   tenancyName = $env:tenancy
   usernameOrEmailAddress = $env:user
   password = $env:pwd
}

Write-Output "Beginning UIPath Orchestrator Authentication"
$authjson = $auth | ConvertTo-Json
$authkey = Invoke-RestMethod -SkipCertificateCheck "$env:url/api/Account/Authenticate" -Method Post -Body $authjson -ContentType 'application/json'
$authjson = $authkey | ConvertTo-Json
$token = $authjson | ConvertFrom-Json
Set-Variable -Name "ts" -Value $token.result

$tokenstring = ConvertTo-SecureString $ts -AsPlainText -Force

Write-Output "Beginning UIPath Orchestrator publish"
 
$Directory = "$env:JENKINS_HOME\jobs\$env:JOB_NAME\builds\$env:BUILD_NUMBER\"
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

Invoke-RestMethod -SkipCertificateCheck -Body $MultipartContent "$env:url/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage" -Method Post -Authentication Bearer -Token ($tokenstring)
Write-Output "The package has been successfully published to Orchestrator and nexus"

Write-Output "Beginning Process Creation"

$PackageArray = $FieldName.split(".")

$release = @{
   Name = $PackageArray[0]
   EnvironmentId = "Development"
   ProcessKey = $PackageArray[0]
   ProcessVersion = "$PackageArray[1].$PackageArray[2].$PackageArray[3]"
}

Invoke-RestMethod -SkipCertificateCheck -Body $release "$env:url/odata/Releases" -Method Post -Authentication Bearer -Token ($tokenstring)

Write-Output "Process Successfully Created"