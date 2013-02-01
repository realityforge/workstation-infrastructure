node.default['terminal']['color_scheme'] = 'Novel'

realityforge_workstation_defaults "Set terminal color scheme to #{node['terminal']['color_scheme']}" do
  domain 'com.apple.Terminal'
  key '"Default Window Settings"'
  string node['terminal']['color_scheme']
end

realityforge_workstation_defaults "Set startup terminal color scheme to #{node['terminal']['color_scheme']}" do
  domain 'com.apple.Terminal'
  key '"Startup Window Settings"'
  string node['terminal']['color_scheme']
end
