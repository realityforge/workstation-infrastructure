node.default["workspace"]["directory"] = "Code"

directory "#{REAL_HOME}/#{node["workspace"]["directory"]}" do
  owner REAL_USER
  mode "0700"
  action :create
end
