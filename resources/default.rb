actions :install

property :source, String
property :destination, String


action :install do
  if node['platform'].eql? 'win32' do
    cookbook_file :destination do
      source :source
      mode '0755'
      action :create
    end
  else
    cookbook_file :destination do
      source :source
      action :create
    end
  end
end
