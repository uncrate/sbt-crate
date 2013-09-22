case platform
when "ubuntu"
  default['sbt']['package'] = "sbt"
when "centos", "redhat", "fedora"
  default['sbt']['package'] = "sbt"
end