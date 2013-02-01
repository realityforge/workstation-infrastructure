# This recipe assumes that rbenv and ruby-build are
# installed prior to invocation of this recipe

node['rbenv']['versions'].each do |version|
  execute "rbenv install #{version}" do
    user REAL_USER
    command "rbenv install #{version}"
    not_if "rbenv versions | grep #{version}"
  end

  execute "rbenv #{version} install bundler" do
    user REAL_USER
    command "rbenv shell #{version}; rbenv exec gem install bundler"
    not_if "rbenv shell #{version}; rbenv exec gem list | grep bundler"
  end
end
