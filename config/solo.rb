cookbook_path File.expand_path(File.join(File.dirname(__FILE__), "..", "cookbooks"))

base_chef_dir = "#{ENV['HOME']}/.chef"
checksum_path "#{base_chef_dir}/checksum"
file_cache_path "#{base_chef_dir}/cache"
file_backup_path "#{base_chef_dir}/backup"
cache_options(:path => "#{base_chef_dir}/cache/checksums", :skip_expires => true)
