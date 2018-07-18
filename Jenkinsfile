pipeline {
    agent { docker { image 'python:3.5.1' } }
    stages {
        stage('build') {
            steps {
                powershell 'Write-Output "Hello, World!"'
            }
        }
    }
}
