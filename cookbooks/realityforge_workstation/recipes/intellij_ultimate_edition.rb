dmg_package "IntelliJ IDEA 12" do
  source "http://download.jetbrains.com/idea/ideaIU-12.0.3.dmg"
  owner REAL_USER
  action :install
end

base_directory = "#{REAL_HOME}/Library/Preferences/IntelliJIdea12"
directory base_directory do
  owner REAL_USER
  group REAL_GROUP
  mode "0700"
end

directory "#{base_directory}/codestyles" do
  owner REAL_USER
  group REAL_GROUP
  mode "0700"
end

template "#{base_directory}/codestyles/StockSoftware.xml" do
  source "StockSoftware.xml.erb"
  owner REAL_USER
  group REAL_GROUP
  mode "0600"
end

template "/Applications/IntelliJ IDEA 12.app/bin/idea.vmoptions" do
  source "idea.vmoptions.erb"
  owner REAL_USER
  group REAL_GROUP
  mode "0600"
end
