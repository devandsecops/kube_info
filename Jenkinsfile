pipeline {
    agent any
    stages {
        stage('My Stage') {
            steps {
                script {
                    def GIT_TAGS = sh (script: "ls -l | awk '{ print \$9 }'", returnStdout:true).trim()
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
        stage('Get File Size'){
            steps{
                script {
                    def FILE_SIZE = sh (script: "ls -lrth ${inputResult} | awk '{ print \$5 }'", returnStdout:true).trim()
                    echo "The size of the file is: ${FILE_SIZE}"
                }
            }
        }
    }
}
