# Jenkins Shared Library<!-- omit in toc -->


- [What is a shared Library?](#what-is-a-shared-library)
- [Shared Library Folder Structure](#shared-library-folder-structure)
  - [Vars](#vars)
  - [Src](#src)
  - [Resources](#resources)
- [Jenkins Snippet Generator](#jenkins-snippet-generator)
- [Jenkinsfile Example](#jenkinsfile-example)
- [More Information](#more-information)


## What is a shared Library?

Jenkins Shared library is the concept of having a common pipeline code in the version control system that can be used by any number of pipelines just by referencing it.

If you have a 20 microservices pipelines, the build, test, deploy, and etc steps will be duplicated in all the 20 pipelines. And whenever a new service gets added, you will copy and paste the pipeline code again. Also, let say you want to change a parameter in any of the steps, you will have to do it all the pipelines manually.

For the same scenario, we can write a shared library for the steps, and in all the pipelines we just have to refer the shared library code. In the future for any changes, all you have to update the shared library code. It will be applied to all the pipelines.

## Shared Library Folder Structure

    jenkins-shared-library
    |____vars
    |____src
    |____resources

### Vars

This directory holds all of the global shared library code what can be called into the pipeline. All of the library files have a .groovy extension. The folder will also support .txt files for documentation on the libraries themselves.

### Src

This directory is a java src directory. You can add custom groovy code here to extend your shared library codebase. You can also import existing Jenkins and plugins classes using an import statement

### Resources

Any non groovy files that are needed for your pipeline go in this folder. For example, powershell scripts, shell scripts, excuteables, json templates, and etc. You will be able to call them in the library using the libraryResource function.

## Jenkins Snippet Generator

You can create the code snippets that can be used in share library function using the Pipeline Syntax Generator available in Jenkins. This will make our life easier for creating custom library DSL. All the supported pipeline functionality can be generated from the snippet generator.

You can access the syntax generator from your Jenkins on /pipeline-syntax/ path. 

    http://your-jenkins-url.com/pipeline-syntax

![Jenkins Pipeline Syntax Generator](https://github.com/VerticalApps-DevOps/jenkins-shared-library/blob/master/resources/Jenkins-Pipeline-Generator.png "Jenkins Pipeline Syntax Generator") 

## Jenkinsfile Example

To use the jenkins shared library you will need to put a jenkinsfile in the root of your project reposity. In the jenkinsfile you will need to call the library directly and then build out the pipeline code based on the libraries that you choose to use. Here is a lite example

    @Library('jenkins-shared-library@master') _

    pipeline {
        agent any
        stages {
            stage('Git Checkout') {
                steps {
                    gitCheckout(
                        branch: "master",
                        url: 'https://github.com/VerticalApps-DevOps/mpldemo.git'
                    )
                }
            }
            stage('Build') {
                steps {
                    powershell returnStatus: true, script: '.\\build.ps1'
                }
            }
            stage('Post-Build') {
                steps {
                    postBuild()
                }
            }
        }
    }

## More Information

For more information on the Jenkins Shared library and how it opoerates please see the official documentation located here: [Jenkins Shared Library Documentation](https://jenkins.io/doc/book/pipeline/shared-libraries/)