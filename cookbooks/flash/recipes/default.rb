case node[:platform]
when 'fedora'
  yum_repository "adobe-linux-x86_64" do
    name "adobe-linux-x86_64"
    description "Adobe Systems Incorporated"
    url "http://linuxdownload.adobe.com/linux/x86_64/"
    action :add
  end

  package "flash-plugin"
end
