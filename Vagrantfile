Vagrant.configure("2") do |config|
  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end
  config.vm.define :streamaprov do |streamaprov|
    streamaprov.vm.box = "centos/stream8"
    streamaprov.vm.network :private_network, ip: "192.168.50.4"
    streamaprov.vm.provision "file", source: "~/OneDrive/Escritorio/finalAprov/streama.service", destination: "$HOME/"
    streamaprov.vm.provision "shell", path: "streamscript.sh"
    streamaprov.vm.hostname = "streamaprov"
  end
  config.vm.define :firewallaprov do |firewallaprov|
    firewallaprov.vm.box = "centos/stream8"
    firewallaprov.vm.network :private_network, ip: "209.191.100.3"
    firewallaprov.vm.network :private_network, ip: "192.168.50.3"
    firewallaprov.vm.provision "shell", path: "firescript.sh"
    firewallaprov.vm.hostname = "firewallaprov"
  end
end
