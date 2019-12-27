pipeline {
	agent any
	options {
		buildDiscarder(logRotator(numToKeepStr: '2'))
        }
	//deleteDir()
	stages {
		stage('Setup') {
			steps {
				sh '''
				if [ -z $versionToDeploy ]; then
           echo "No versionToDeploy specified. Aborting."
      		 exit 1
        fi
        '''
			}
		}
	}
}
