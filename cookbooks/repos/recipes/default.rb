case node[:platform]
when 'fedora'
  path = "/tmp/rpmfusion-free-release-stable.noarch.rpm"

  bash "download rpmfusion free package" do
    code "wget http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm -O #{path}"
    not_if { File.exist?(path) }
  end

  package "rpmfusion-free-release-stable" do
    source path
    options "--nogpgcheck"
  end

  path = "/tmp/rpmfusion-nonfree-release-stable.noarch.rpm"

  bash "download rpmfusion nonfree package" do
    code "wget http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm -O #{path}"
    not_if { File.exist?(path) }
  end

  package "rpmfusion-nonfree-release-stable" do
    source path
    options "--nogpgcheck"
  end

  package 'yum-plugin-fastestmirror'
end
