case node[:platform]
when 'fedora'
  path = "/tmp/rpmfusion-free-release-stable.noarch.rpm"

  bash "download rpmfusion free package" do
    code "curl http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm -o #{path}"
    not_if { File.exist?(path) }
  end

  package "rpmfusion-free-release-stable" do
    source path
    options "--nogpgcheck"
  end

  path = "/tmp/rpmfusion-nonfree-release-stable.noarch.rpm"

  bash "download rpmfusion nonfree package" do
    code "curl http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm -o #{path}"
    not_if { File.exist?(path) }
  end

  package "rpmfusion-nonfree-release-stable" do
    source path
    options "--nogpgcheck"
  end

  package 'yum-plugin-fastestmirror'

  bash "configure yum" do
    code "yum-config-manager --setopt clean_requirements_on_remove=1 --save >/dev/null"
    not_if %(grep "clean_requirements_on_remove" /etc/yum.conf)
  end
end
