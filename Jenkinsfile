pipeline{
    agent { label 'workervm' }
    
    stages{
        stage("Checkout"){
            steps{
                checkout scm
            }
        }
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
                sh 'tar --exclude=.git --exclude=www/js --exclude=www/css --exclude=archive -czvf archive/mdt.tgz .'
            }
        }
    }
} 
