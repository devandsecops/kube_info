pipeline {
    agent {label 'kube'}
    stages {
        stage('My Stage') {
            steps {
                script {
                    def GIT_TAGS = sh (script: "ls -l | awk '{ print ${9} }'", returnStdout:true).trim()
                    inputResult = input(
                        message: "Select a git tag",
                        parameters: [choice(name: "git_tag", choices: "${GIT_TAGS}", description: "Git tag")]
                    )
                }
            }
        }
        stage('My other Stage'){
            steps{
                echo "The selected tag is: ${inputResult}"
            }
        }
    }
}
