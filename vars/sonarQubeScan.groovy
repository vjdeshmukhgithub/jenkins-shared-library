def call() {
    script {
        scannerHome = tool 'SonarScanner'
    }
    withSonarQubeEnv('Vertical Apps SonarQube') {
        bat "\"${scannerHome}\\bin\\sonar-scanner.bat\" -D sonar.projectKey=${env.JOB_NAME}"
    }
    timeout(time: 30, unit: 'MINUTES') {
        waitForQualityGate abortPipeline: true
    }
}