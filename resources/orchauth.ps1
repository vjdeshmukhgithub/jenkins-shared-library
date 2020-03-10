function orchAuth($ORCH_USER, $ORCH_PASS){
   $auth = @{
      tenancyName = 'VerticalApps'
      usernameOrEmailAddress = $ORCH_USER
      password = $ORCH_PASS
   }
   $authjson = $auth | ConvertTo-Json
   $authkey = Invoke-RestMethod -SkipCertificateCheck 'https://uipath.verticalapps.com/api/Account/Authenticate' -Method Post -Body $authjson -ContentType 'application/json'
   $authjson = $authkey | ConvertTo-Json
   $token = $authjson | ConvertFrom-Json -AsHashtable
   return $token.result
}