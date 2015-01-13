name             'roma'
maintainer       'Rui Bando'
maintainer_email 'bando.rui@gmail.com'
license          'MIT'
description      'Installs ROMA and/or sets upa'
version          "0.1.0"
depends          'rbenv'

recipe "roma", "Installs and configures ROMA"

%w{ centos ubuntu }.each do |os|
  supports os
end
