<h1>simple automatic deployment</h1>
<p>sudo add-apt-repository ppa:git-core/ppa<br>
sudo apt update<br>
sudo apt-get install git<br>
git --version <br>
#modified git config<hr>
user.name=Valentyn Yegorov<br>
user.email=akuras@ex.ua<br>
core.etitor=vim<br>
core.autocrlf=input<hr>
sudo apt-get install nginx<br>
sudo nginx -V</p>
<p>#Forked https://github.com/joashp/material-design-template to https://github.com/Akurasoid/material-design-template.git</p>
<p>mkdir ~/trainig/MDT<br>
cd ~/trainig/MDT<br>
git init<br>
git clone git@github.com:Akurasoid/material-design-template.git<br>
git remote add origin git@github.com:Akurasoid/material-design-template.git<br>
git remote -v</p>
<p>crontab -e<br>
#added <br>
*/1 * * * * /home/ak/trainig/MDT/timescr.sh<br>
vi timescr.sh<br>
<hr>
#! /bin/bash<br>

git pull origin master --rebase<br>
echo 'pull is done -' $(date) >> /home/ak/cronTlocal.log<br>
<hr>
chmod +x timescr.sh<br>

sudo vi /etc/nginx/sites-available/default<br>
#changes:<br>
<hr>
#root /var/www/html;<br>
  root /home/ak/trainig/MDT/www;<br>
<hr>
sudo systemctl restart nginx<br>
sudo systemctl status nginx<br>
#check webpage in browser (localhost:80)<br>
#append some changes in index.html. check webpage in browser<br>
git add .<br>
git commit -am "index.html modified"<br>
git push origin master<br>
#(SSH key already added before)<br>
#check home/ak/cronTlocal.log after few min<br>
</p>
<p>#Github hook<br>
#in github settings added http://31.43.138.248:8080/github-webhook/, Content type - application/json, events - Just the push event, chechbox "Active"<br>
sudo apt-get install default-jdk<br>
wget –q –O – https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add –<br>
sudo sh –c ‘echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list’<br>
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \<br>
     /etc/apt/sources.list.d/jenkins.list'<br>
sudo apt-get update <br>
sudo apt-get install jenkins<br>
sudo systemctl status jenkins<br>
#open web-interface (localhost:8080)<br>
#check Admin password<br>
sudo cat /var/lib/jenkins/secrets/initialAdminPassword<br>
#make basic configuration<br>
#set up dst-nat on router (MikroTik RouterOS 6.49)<br>
/ip firewall nat<br>
add action=dst-nat chain=dstnat dst-port=8080 protocol=tcp to-addresses=192.168.3.2<br>
#set up local Debian firewall<br>
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT<br>
#add new project in Jenkins for https://github.com/Akurasoid/material-design-template.git (*/master branch) - Build Triggers: GitHub hook trigger for GITScm polling<br>
#There are some screenshots in folder "screenshot"
</p>
