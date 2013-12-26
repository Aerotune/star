# public key: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkYZzxKR/3GgfNf5g7+vTEIdptUmXi2RHe2qwf/5ExhVmj9XV6dsEstlq/+v1XjcFmiHnqG1K7In2VDtDNi93rTB74GE/N607XtuiQd/9EyJXdoJVPDcb7A3QucJX5+0WzSyJJGZf50GRPZP5IDUF3JFR+qj/rhRej0ygmSTQTO0NOXY5CDTVPHVFu9fqZTtI4D3FUiNKqcN5vfZ1WTmyGfbexrxGiItSc0zcQ61AI6ZY6EnYfvldIbWtpx8VgbblZFSiVBHsDOTPpBJPGtqYUsr8s7Jd4legTyQIdcHJ/j9nnTI0L/F+Jr0AEai/9ZL1bi9l5XUGzPuprRenl8/nd aerotune@gmail.com
set :stage, :production
set :branch, :production
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deploy@146.185.132.229}
role :web, %w{deploy@146.185.132.229}
role :db,  %w{deploy@146.185.132.229}, primary: true

# Enter your github username here
set :scm_username, "aerotune"

set :deploy_to, '/var/www/star_production'

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '146.185.132.229', user: 'deploy', roles: %w{web app db}#, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
server '146.185.132.229',
  user: 'deploy',
  roles: %w{web app db},
  ssh_options: {
    user: 'deploy', # overrides user setting above
    keys: %w(/home/deploy/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }

fetch(:default_env).merge!(rails_env: :production)
