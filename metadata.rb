name             'sbt-crate'
maintainer       'John Leacox'
license          'Apache 2.0'
description      'Installs/Configures sbt (simple build tool)'
version          '0.1.0'

%w{
  ubuntu
  centos
  redhat
  mac_os_x
}.each do |os|
  supports os
end

depends 'uncrate_base'
depends 'homebrew'