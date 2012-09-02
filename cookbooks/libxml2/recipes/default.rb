case node[:platform]
when 'ubuntu'
  package 'libxml2-dev'
  package 'libxslt-dev'
  package 'libxml2-utils' # for xmllint

when 'fedora'
  package 'libxml2-devel'
  package 'libxslt-devel'

when 'mac_os_x'
  package 'libxml2'
end
