pipeline {
   agent any
   stages {
      stage('user input') {
         steps {
            script {
               def apps = sh (script: "helm ls | awk '{print $1}' | sed -n '1!p'", returnStdout:true).trim()
               timeout ( time: 10, unit: "MINUTES" )  {
                  HELMLS=input( id: 'userInput', message: 'List out helm releases', parameters: [ [$class: 'ChoiceParameterDefinition', choices: apps, description: '', name: 'Application:'] ])
               }
            }
         }
      }
    }
}
