# This recipe assumes that rbenv and ruby-build are
# installed prior to invocation of this recipe

node['rbenv']['versions'].each do |version|
  execute "rbenv install #{version}" do
    user REAL_USER
    command "rbenv install #{version}"
    not_if "rbenv versions | grep #{version}"
  end
end
