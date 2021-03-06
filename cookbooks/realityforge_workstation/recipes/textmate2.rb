node.default["textmate"]["url"] = "https://github.com/downloads/textmate/textmate/TextMate_r9345.tbz"

unless File.exists?("/Applications/TextMate.app")
  directory Chef::Config[:file_cache_path] do
    action :create
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/textmate.zip" do
    source node["textmate"]["url"]
    owner REAL_USER
  end

  execute "extract text mate to /Applications" do
    command "tar -xvf #{Chef::Config[:file_cache_path]}/textmate.zip -C /Applications/"
    user REAL_USER

    # This is required to unzip into Applications
    group "admin"
  end

  execute "link textmate" do
    command "ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate"
    not_if "test -e /usr/local/bin/mate"
  end

  ruby_block "test to see if TextMate was installed" do
    block do
      raise "TextMate install failed" unless File.exists?("/Applications/TextMate.app")
    end
  end
end

execute "link textmate" do
  command "ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate"
  not_if "test -e /usr/local/bin/mate"
end

file "#{REAL_HOME}/.bash.d/textmate.sh" do
  action :create
  owner REAL_USER
  content "export EDITOR=\"/usr/local/bin/mate -w\"\n"
end

directory "#{REAL_HOME}/Library/Application Support/TextMate" do
  mode "0700"
  owner REAL_USER
  group REAL_GROUP
  action :create
end

template "#{REAL_HOME}/Library/Application Support/TextMate/Global.tmProperties" do
  source "Global.tmProperties.erb"
  mode "0700"
  owner REAL_USER
  group REAL_GROUP
end
