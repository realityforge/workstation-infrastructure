# Recommendations derived from
# http://www.macgasm.net/2013/01/18/good-morning-your-mac-keeps-a-log-of-all-your-downloads/

realityforge_workstation_defaults "Disable quarantine download list" do
  domain 'com.apple.LaunchServices'
  key 'LSQuarantine'
  boolean false
end


execute "Purge download file list" do
  command "sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
end
