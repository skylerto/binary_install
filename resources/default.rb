actions :install

property :source, String, name_property: true
property :service, String
property :destination, String
property :destinations, Hash
property :archive, String
property :strip_directory, String


action :install do
  log "#{service}, #{source}, #{destination}, #{destinations}, #{archive}"


  if node[:platform_family].include? 'win'
    if destinations['windows']
      destination = destinations['windows']
    end
  else
    if destinations['linux']
      destination = destinations['linux']
    end
    # => On Ubuntu/Most linux distros
    directory "#{destination}/#{service}" do
      owner 'root'
      group 'root'
      mode '0755'
      recursive true
      action :create
    end
    cookbook_file "/tmp/#{source}" do
      source source
      mode '0755'
      action :create
    end
    if archive.eql? 'tar.gz'
      if strip_directory.eql? 'true'
        execute 'untar strip' do
          command "tar xzf /tmp/#{source} -C #{destination}/#{service} --strip-components=1"
          not_if { ::File.exist?("#{destination}/#{service}") }
          action :run
        end
      else
        execute 'untar no strip' do
          command "tar xzf /tmp/#{source} -C #{destination}/#{service}"
          not_if { ::File.exist?("#{destination}/#{service}") }
          action :run
        end
      end
    elsif archive.eql? 'zip'
      if strip_directory.eql? 'true'
        execute 'unzip strip' do
          command "unzip /tmp/#{source} && mv /tmp/#{source.sub(/\.zip/, '')} #{destination}/#{service}"
          not_if { ::File.exist?("#{destination}/#{service}") }
          action :run
        end
      else
        execute 'unzip no strip' do
          command "unzip /tmp/#{source} -d #{destination}/#{service}"
          not_if { ::File.exist?("#{destination}/#{service}") }
          action :run
        end
      end
    end
  end
end
