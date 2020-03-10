def call(Map stageParams){
    checkout([
        $class: 'GitSCM',
        branches: [[name: stageParams.branch]],
        doGenerateSubmoduleConfigurations: false,
        userRemoteConfigs: [[credentialsId: 'Github-API-Token', url: stageParams.url]]
    ])
}