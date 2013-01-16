directory "#{REAL_HOME}/.bash.d" do
  owner REAL_USER
  mode "0700"
  action :create
end

template "#{REAL_HOME}/.bashrc" do
  source "bashrc.sh.erb"
  mode "0755"
  owner REAL_USER
  group REAL_GROUP
end

link "#{REAL_HOME}/.bash_login" do
  to "#{REAL_HOME}/.bashrc"
  owner REAL_USER
  group REAL_GROUP
end

template "#{REAL_HOME}/.bash.d/prompt.sh" do
  source "prompt.sh.erb"
  mode "0700"
  owner REAL_USER
  group REAL_GROUP
end

