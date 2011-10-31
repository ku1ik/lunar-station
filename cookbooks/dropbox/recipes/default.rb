case node[:platform]
when 'fedora'
  yum_repository "Dropbox" do
    name "dropbox"
    description "Dropbox Repository"
    url "http://linux.dropbox.com/fedora/$releasever/"
    key "http://linux.dropbox.com/fedora/rpm-public-key.asc"
    action :add
  end

  package "nautilus-dropbox"
end
