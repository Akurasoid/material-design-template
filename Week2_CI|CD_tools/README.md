## Lab: simple CI pipeline
### 1. install openjdk-8-jdk, Git on new VM<br>
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk git -y   
later I upgraded to OpenJDK-11-JDK because Java 11 is the recommended version to run Jenkins on (Jenkins documentation).<br>
#### install Jenkins with enabling autostart on startup <br>
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install jenkins -y
    sudo systemctl status jenkins.service
#### check line<br>
> Loaded: loaded (/etc/init.d/jenkins; generated)
#### setup custom port 8081 for Jenkins <br>
    sudo vi /etc/default/jenkins
#### change HTTP_PORT=8080 to HTTP_PORT=8081<br>
    sudo systemctl restart jenkins
#### (or akurasu.ln.ua:8081/restart -> Yes)<br>
#### enter Jenkins via web-browser (http://akurasu.ln.ua:8081/)<br>
#### check initialAdminPassword<br>
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#### plugins – select plugins, add GitHub and Role-based authorization strategy
![](RBAS.png)
#### add new user<br>
![](users.png)
### 2. Create Agent VM<br>
connect agent to master node <br>
set up ssh connection between Jenkins and agent<br>
![](workervm_conf.png)
#### Agent status
![](nodes_status.png)
### 3. Configure tools – NodeJS<br>
http://akurasu.ln.ua:8081/pluginManager/available -> install NodeJS Plugin<br>
![](NodeJS_Plugin.png)<br>
#### Add NodeJS
![](NodeJS.png)
### 4. Create “Multibranch Pipeline” pipeline job<br>
![](Screenshot_1.png)
![](Branch.master.png)
![](build24.png)
![](build25.png)
### 5. Setup the GitHub webhook to trigger the jobs
![](webhook.conf.png)
![](webhook.status.png)
