case node[:platform]
when 'fedora'
  package "freetype-freeworld"

  package "google-droid-sans-fonts"
  package "google-droid-sans-mono-fonts"
  package "google-droid-serif-fonts"
when 'ubuntu'
  package 'ttf-droid'
  package 'ttf-bitstream-vera'
end
