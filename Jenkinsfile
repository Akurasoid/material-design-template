pipeline{ 
    agent { label 'workervm' } 
       stages { 
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
                archiveArtifacts artifacts: 'archive/mdt.tgz', fingerprint: true 
            } 
        } 
        stage("publish"){ 
            steps{ 
                rtUpload ( 
                    serverId: "JFrog", 
                    spec: 
                        """{ 
                            "files": [ 
                                { 
                                "pattern": "archive/mdt.tgz", 
                                "target": "default-generic-local/artifacts_${BUILD_NUMBER}.tgz" 
                                } 
                            ] 
                        }""" 
                    ) 
            } 
          } 
       } 
    }
