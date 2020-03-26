def call() {
    script {
        // Must match name of SonarQube Scanner installation on Jenkins server
        scannerHome = tool 'SonarScanner'
    }
    // Must match the name of SonarQube server
    withSonarQubeEnv('Vertical Apps SonarQube') {
        bat "\"${scannerHome}\\bin\\sonar-scanner.bat\" -D sonar.projectKey=${env.JOB_NAME}"
    }
    timeout(time: 30, unit: 'MINUTES') {
        waitForQualityGate abortPipeline: true
    }
}