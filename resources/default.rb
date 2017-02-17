actions :install

property :source, String, name_property: true
property :service, String
property :destination, String
property :destinations, Hash
property :archive, String
property :strip_directory, String
property :usern, String

action :install do
  log "#{service}, #{source}, #{destination}, #{destinations}, #{archive}"
  temp_dir = Chef::Config[:file_cache_path]
  
  if node[:platform_family].include? 'win'
    if destinations['windows']
      destination = destinations['windows']
    end
    zip_file = "#{temp_dir}/#{source}"
    directory "#{destination}" do
      recursive true
      action :create
    end
    cookbook_file "#{temp_dir}/#{source}" do
      source source
      action :create
    end
    if archive.include? 'zip'
      windows_zipfile "#{destination}" do
        source zip_file
        action :unzip
      end
    else
      Chef::Application.fatal!("#{archive} not currently supported for windows!")
    end
  else
    if destinations['linux']
      destination = destinations['linux']
    end
	if usern == ""
		usern = 'root'
	end
    # => On Ubuntu/Most linux distros
    directory "#{destination}/#{service}" do
      owner usern
      mode '0755'
      recursive true
      action :create
    end
    cookbook_file "#{temp_dir}/#{source}" do
      source source
      mode '0755'
	  owner usern
      action :create
    end
    if archive.include? 'tar.gz'
      if strip_directory.eql? 'true'
        execute 'untar strip' do
          command "tar xzf #{temp_dir}/#{source} -C #{destination}/#{service} --strip-components=1"
		  user usern
          action :run
        end
      else
        execute 'untar no strip' do
          command "tar xzf #{temp_dir}/#{source} -C #{destination}/#{service}"
		  user usern
          action :run
        end
      end
    elsif archive.eql? 'zip'
      if strip_directory.eql? 'true'
        execute 'unzip strip' do
          command "unzip #{temp_dir}/#{source} && mv #{temp_dir}/#{source.sub(/\.zip/, '')} #{destination}/#{service}"
          action :run
        end
      else
        execute 'unzip no strip' do
          command "unzip #{temp_dir}/#{source} -d #{destination}/#{service}"
          action :run
        end
      end
    end
  end
end
