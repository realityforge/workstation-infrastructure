dmg_package "IntelliJ IDEA 12" do
  source "http://download.jetbrains.com/idea/ideaIU-12.0.2.dmg"
  owner REAL_USER
  action :install
end

template "/Applications/IntelliJ IDEA 12.app/bin/idea.vmoptions" do
  source "idea.vmoptions.erb"
  owner REAL_USER
  group REAL_GROUP
  mode "0600"
end
