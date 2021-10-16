pipeline{
    agent { label 'workervm' }
    tools { nodejs 'nodeJS' }
    stages{
        stage('CompressingJS'){
            parallel{
                stage('CleanCSS'){
                    steps{
                        nodejs(nodeJSInstallationName: 'nodeJS'){
                        sh 'cleancss -o www/min/*.css www/css/*.css'
                        }
                    }
                }
                stage('UglifyJS'){
                    steps{
                        nodejs(nodeJSInstallationName: 'nodeJS'){
                        sh 'uglifyjs -o www/min/*.js www/js/*.js'
                        }
                    }
                }
            }
        }
        stage('archive'){
            steps{
                sh 'mkdir -p archive'
                sh 'tar --exclude=.git --exclude=www/js --exclude=www/css -czvf archive/mdt.tgz .'
            }
        }
    }
} 
