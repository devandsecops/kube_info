node() {
  deleteDir()
    stage('Hello') {
      sh '''
      echo "Hello"
      echo "World"
      '''
    }
    stage('Trigger Automation Job') {
      when {
        branch 'master'
          //tag "*-SNAPSHOT"
      }
        steps {
          sleep 60
          build job: 'abc', wait: true
        }
    }
}
