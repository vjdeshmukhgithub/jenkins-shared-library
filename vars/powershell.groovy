#!/usr/bin/env groovy

def call() {

    powershell label: '', returnStatus: true, script: 'Write-Host \'Live for today, YOLO!!!\''
}