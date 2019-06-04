pipeline {
   stages {
      stage('user input') {
         steps {
            script {
               def apps = pillarFiles(this,env.GIT_CREDS)
               timeout ( time: 10, unit: "MINUTES" )  {
                  DEPLOY_BACKEND=input message: 'What is the deployment backend?',  parameters: [choice(choices: 'kubernetes\nappservice\nservicefabric\nssh\nhelm', description: '', name: 'Deployment Backend:')]
                  if (DEPLOY_BACKEND == "kubernetes" ) {
                    CANARY=input message: 'Do you want to do a canary deployment?', parameters: [choice(choices: 'no\nyes', description: '', name: 'Canary:')]
                    if (CANARY == "yes" ) {
                      CANARY_PERCENT=input message: 'What percentage of traffic?', parameters: [string(defaultValue: '10', description: '', name: 'Canary weight:')]   
                    }
                  }
                  if (DEPLOY_BACKEND == "appservice") {
                     CLOUD='azure'
                  }else {
                     CLOUD=input message: 'What is the deployment cloud?',  parameters: [choice(choices: 'gcp\nazure', description: '', name: 'Cloud:')]
                  }
                  JBNAME=input( id: 'userInput', message: 'What application are we deploying?', parameters: [ [$class: 'ChoiceParameterDefinition', choices: apps, description: '', name: 'Application:'] ])
                  GIT_TAG=input message: 'What version are we deploying?', parameters: [string(defaultValue: '', description: '', name: 'Version:')]
                  try {
                     PROJECT=sh(returnStdout: true, script: "gcloud projects list --format='value(projectId)'").trim()
                     if (PROJECT == "jbkube-nonprod-b64ba0b2") {
                        TARGET_ENV=input message: 'Which environment are deploying to?', parameters: [choice(choices: 'dev\nint\nqa', description: '', name: 'Target Environment')]
                     }else if (PROJECT == "jbkube-prod-2aab5514") {
                        TARGET_ENV=input message: 'Which environment are deploying to?', parameters: [choice(choices: 'stg\nprd', description: '', name: 'Target Environment')]
                     }else {
                        TARGET_ENV=input message: 'Which environment are deploying to?', parameters: [choice(choices: 'dev\nint\nqa\nstg\nprd', description: '', name: 'Target Environment')]
                     }
                  } catch(Exception e){
                        TARGET_ENV=input message: 'Which environment are deploying to?', parameters: [choice(choices: 'dev\nint\nqa\nstg\nprd', description: '', name: 'Target Environment')]
                  }
               }
            }
         }
      }
}
