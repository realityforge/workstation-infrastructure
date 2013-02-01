workspace_directory = File.expand_path("#{REAL_HOME}/#{node["workspace"]["directory"]}")
directory workspace_directory do
  owner REAL_USER
  mode "0700"
  action :create
end

node['workspace']['projects'].each_pair do |key, config|
  project_dir = File.expand_path("#{workspace_directory}/#{key}")
  parent_dir = project_dir

  while (parent_dir = File.dirname(parent_dir)) != workspace_directory
    directory parent_dir do
      owner REAL_USER
      mode "0700"
      action :create
    end
  end

  if config['git_repository']
    execute "clone #{key}" do
      command "git clone #{config['git_repository']} #{project_dir}"
      user REAL_USER
      cwd project_dir
      not_if { ::File.exists?(project_dir) }
    end
  end
end
