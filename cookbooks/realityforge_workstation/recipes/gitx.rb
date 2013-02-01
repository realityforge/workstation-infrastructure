unless File.exists?("/Applications/GitX.app")
  remote_file "#{Chef::Config[:file_cache_path]}/gitx.zip" do
    source node["gitx_download_location"]
    owner REAL_USER
  end

  directory "#{Chef::Config[:file_cache_path]}/GitX.app" do
    action :delete
    recursive true
  end

  execute "unzip gitx" do
    command "unzip #{Chef::Config[:file_cache_path]}/gitx.zip -d #{Chef::Config[:file_cache_path]}/"
    user REAL_USER
    group "admin"
  end

  execute "copy gitx to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/GitX.app /Applications"
  end

  link "/usr/local/bin/gitx" do
    to "/Applications/GitX.app/Contents/Resources/gitx"
  end
end

