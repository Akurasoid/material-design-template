<h1>simple automatic deployment</h1>
<p>sudo add-apt-repository ppa:git-core/ppa<br>
sudo apt update<br>
sudo apt-get install git<br>
git --version <br>
sudo apt-get install nginx<br>
sudo nginx -V</p>
<p>#Forked https://github.com/joashp/material-design-template to https://github.com/Akurasoid/material-design-template.git</p>
<p>mkdir ~/trainig/MDT<br>
cd ~/trainig/MDT<br>
git init<br>
git clone git@github.com:Akurasoid/material-design-template.git<br>
git remote add origin git@github.com:Akurasoid/material-design-template.git<br>
#(SSH key already added before)<br>
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
(#root /var/www/html;<br>
  root /home/ak/trainig/MDT/www;)<br>
<hr>
sudo systemctl restart nginx<br>
sudo systemctl status nginx<br>
#check webpage in browser (localhost:80)<br>
#append some changes in index.html. check webpage in browser<br>
git add .<br>
git commit -am "index.html modified"<br>
git push origin master<br>
#check home/ak/cronTlocal.log after few min<br>
</p>