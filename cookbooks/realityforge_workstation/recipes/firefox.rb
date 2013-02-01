dmg_package "Firefox" do
  source "http://download.mozilla.org/?product=firefox-18.0&os=osx&lang=en-US"
  action :install
  owner REAL_USER
end
