pipeline{
    agent { label 'workervm' }
    stages{
        stage("CompressingJS"){
            parallel{
                stage("CleanCSS"){
                    steps{
                        nodejs(nodeJSInstallationName: 'nodeJS'){
                        sh 'cleancss -o www/min/*.css www/css/*.css'
                        }
                    }
                }
                stage("UglifyJS"){
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
                sh "tar --exclude='./.git' --exclude='./css' --exclude='./js' -zcvf /archive/mdt.tgz"
            }
        }
    }
} 
