pipeline {
	agent any
	deleteDir()
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
