Vagrant.configure(2) do |config|
	config.vm.define "OIPv3-box" do |oipbox|
		oipbox.vm.box = "ubuntu/xenial64"
   				oipbox.vm.network "private_network", ip: "192.168.99.9"
					devbox.vm.hostname = "oip-box"
				  oipbox.vm.provision "shell", path: "scripts/install.sh"
    		oipbox.vm.provider "virtualbox" do |v|
    		  v.memory = 4096
    		  v.cpus = 2
    		end
	end
end
