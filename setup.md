install rvm, ruby, and git
## SSH
https://help.github.com/articles/generating-ssh-keys
https://help.github.com/articles/using-ssh-agent-forwarding

/etc/ssh_config
on server: /etc/ssh/ssh_config
on localhost: /etc/ssh_config


#### RVM
https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
start rvm:
  source /etc/profile.d/rvm.sh
  
  
## Capistrano forward agent
http://blog.blenderbox.com/2013/02/20/ssh-agent-forwarding-with-github/

## On server
mkdir /var/www
chmod 777 /var/www


## Yay it works but I have this issue
http://www.capistranorb.com/documentation/faq/why-does-something-work-in-my-ssh-session-but-not-in-capistrano/

AND this solved my problem!!
http://stackoverflow.com/questions/20630731/rails-capistrano-3-and-ssh-agent-forwarding

Add this on server: /etc/ssh/ssh_config

Host github.com
  Hostname github.com
  ProxyCommand ssh -q deploy@localservername nc -q0 %h 22
  User git

 # Also make sure you have this:

Host *
  SendEnv LANG LC_*
  ForwardAgent yes