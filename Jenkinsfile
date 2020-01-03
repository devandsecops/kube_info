pipeline {
    agent {label 'ubuntu18'}
    stages {
        stage ("Hello") {
            steps {
                echo "Hello!!"
            }
        }
        stage (Boto3) {
            steps {
              sh '''
              sudo python boto.py
              '''
            }
        }
    }
}
