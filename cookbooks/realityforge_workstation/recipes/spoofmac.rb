# Randomize my "hardware" mac on startup
# Derived from http://erratasec.blogspot.com.au/2013/01/i-conceal-my-identity-same-way-aaron.html

directory "/Library/StartupItems/SpoofMAC" do
  mode "0755"
  action :create
end

template "/Library/StartupItems/SpoofMAC/StartupParameters.plist" do
  source "spoofmac_startup.plist.erb"
  mode "0755"
end

template "/Library/StartupItems/SpoofMAC/SpoofMAC" do
  source "spoofmac.sh.erb"
  mode "0755"
end
