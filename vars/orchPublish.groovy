import groovy.json.JsonSlurper

String jsonString = '''{
"result": "",
"targetUrl": "",
"success": "",
"error": "",
"unAuthorizedRequest": "",
"__abp": ""
}'''

JsonSlurper slurper = new JsonSlurper()

Map parsedJson = slurper.parseText(jsonString)

def call() {
   Map parsedJson = slurper.parseText(curl --location --insecure --request POST 'https://uipath.verticalapps.com/api/Account/Authenticate' \
      --header 'Content-Type: application/json' \
      --data-raw '{
      "tenancyName": "VerticalApps",
      "usernameOrEmailAddress": "admin",
      "password": "myOrchestratorVapps11"
      }')
   
   token = parsedJson.result

   curl -XPOST --insecure -v -H 'Authorization: Bearer $token' '-F file=@C:\\Program Files (x86)\\Jenkins\\workspace\\test-shared-library@tmp\\Output\\Test.1.0.7.nupkg' 'https://uipath.verticalapps.com/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage'

}