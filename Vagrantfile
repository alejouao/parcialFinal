Vagrant.configure("2") do |config|
  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end
  config.vm.define :stream do |stream|
    stream.vm.box = "centos/stream8"
    stream.vm.network :private_network, ip: "192.168.100.4"
    stream.vm.hostname = "stream"
  end
  config.vm.define :firewall do |firewall|
    firewall.vm.box = "centos/stream8"
    firewall.vm.network :private_network, ip: "209.191.100.3"
    firewall.vm.network :private_network, ip: "192.168.100.3"
    firewall.vm.hostname = "firewall"
  end
end