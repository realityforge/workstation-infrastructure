execute "Install homebrew" do
  command 'ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"'
  user REAL_USER
  not_if { File.exist?('/usr/local/Cellar') }
end

execute "Update homebrew recipes" do
  command '/usr/local/bin/brew update'
  user REAL_USER
  only_if { node['brew']['update'] }
end

execute "Upgrade homebrew packages" do
  command '/usr/local/bin/brew upgrade'
  user REAL_USER
  only_if { node['brew']['upgrade_all'] }
end

packages = {}

node['brew']['packages'].each do |package|
  packages[package] = ''
end

node['brew']['custom_packages'].each_pair do |package, options|
  packages[package] = options
end

packages.each_pair do |package, options|
  execute "brew install #{package}" do
    user REAL_USER
    command "brew install #{package} #{options}"
    not_if "brew list | grep #{package}"
  end
end
