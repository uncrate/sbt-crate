return if skip_unsupported_platform

case node[:platform]
when "ubuntu", "centos", "redhat"
	sbt_jar_filename = File.basename(node['sbt']['download_url'])
	sbt_install_path = "#{node['sbt']['install_path']}/#{node['sbt']['install_dir']}"

	directory sbt_install_path do
	  mode "0755"
	end

	remote_file sbt_jar_filename do
	  source node['sbt']['download_url']
	  path "#{sbt_install_path}/#{sbt_jar_filename}"
	  mode "0755"
	end

	template "/usr/bin/sbt" do
	  source "sbt.sh.erb"
	  mode "0755"
	end
when "mac_os_x"
  package 'sbt' do
    action :install
  end
end
