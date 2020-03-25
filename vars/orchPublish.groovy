import groovy.json.JsonSlurper

def call() {
   sh('echo hollo')
   /* String jsonString = '''{
   "result": "",
   "targetUrl": "",
   "success": "",
   "error": "",
   "unAuthorizedRequest": "",
   "__abp": ""
   }'''

   JsonSlurper slurper = new JsonSlurper()

   Map parsedJson = slurper.parseText(jsonString)

   json='{"tenancyName": "VerticalApps", "usernameOrEmailAddress": "admin", "password": "myOrchestratorVapps11"}'
   println "starting call"

   parsedJson = [ 'bash', '-c', "curl -v -k -X POST -H \"Content-Type: application/json\" -d '${json}' https://uipath.verticalapps.com/api/Account/Authenticate" ].execute().text

   parsedJson.waitFor()
   println parsedJson.err.text
   println parsedJson.text
   println "token recieved"

   println parsedJson.result
   token = parsedJson.result */

   //curl -XPOST --insecure -v -H 'Authorization: Bearer $token' '-F file=@C:\\Program Files (x86)\\Jenkins\\workspace\\test-shared-library@tmp\\Output\\Test.1.0.7.nupkg' 'https://uipath.verticalapps.com/odata/Processes/UiPath.Server.Configuration.OData.UploadPackage'

}