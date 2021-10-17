# Lab: simple CI pipeline <br>
<br>
# install openjdk-8-jdk, Git<br>
sudo apt-get install software-properties-common<br>
sudo add-apt-repository ppa:git-core/ppa<br>
sudo apt-get update <br>
sudo apt-get install openjdk-8-jdk git -y<br>
# later I upgraded to OpenJDK-11-JDK coz Java 11 is the recommended version to run Jenkins on (Jenkins documentation).<br>
<br>
# install Jenkins with enabling autostart on startup <br>
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -<br>
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'<br>
sudo apt-get update<br>
sudo apt-get install jenkins -y<br>
sudo systemctl status jenkins.service<br>
# check line<br>
    Loaded: loaded (/etc/init.d/jenkins; generated)<br>
<br>
# setup custom port 8081 for Jenkins <br>
sudo vi /etc/default/jenkins<br>
# change HTTP_PORT=8080 to HTTP_PORT=8081<br>
sudo systemctl restart jenkins<br>
# (or akurasu.ln.ua:8081/restart -> Yes)<br>
# enter Jenkins via web-browser (http://akurasu.ln.ua:8081/)<br>
# check initialAdminPassword<br>
sudo cat /var/lib/jenkins/secrets/initialAdminPassword<br>
<br>
# plugins – select plugins, add GitHub and Role-based authorization strategy <br>
# add new user<br>
![](material-design-template/Week2_CI|CD_tools/users.png)
<br>
# 2. Create Agent VM<br>
# connect agent to master node <br>
<br>
# 3. Configure tools – NodeJS<br>
http://akurasu.ln.ua:8081/pluginManager/available -> install NodeJS Plugin<br>
![](NodeJS Plugin.png)
# set up ssh connection between Jenkins and agent<br>
![](NodeJS.png)
4. Create “Multibranch Pipeline” pipeline job<br>

