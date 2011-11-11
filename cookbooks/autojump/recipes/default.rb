package 'autojump'

case node[:platform]
when 'fedora'
  package 'autojump-zsh'
end
