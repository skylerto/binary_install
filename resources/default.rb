actions :install

property :service, String, name_property: true
property :source, String
property :destination, String
property :archive, String
property :strip_directory, Boolean


action :install do
  log "#{service}, #{source}, #{destination}, #{archive}"
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
    if strip_directory
      execute 'untar' do
        command "tar xzf /tmp/#{source} -C #{destination}/#{service} --strip-components=1"
        action :run
      end
    else
      execute 'untar' do
        command "tar xzf /tmp/#{source} -C #{destination}/#{service} --strip-components=1"
        action :run
      end
    end
  elsif archive.eql? 'zip'
    # execute 'unzip' do

    # end
  end

end
