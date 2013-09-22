return if skip_unsupported_platform

case node['platform']
when "ubuntu"
  # add the typesafe apt repository
  apt_repository "typesafe" do
    uri "http://apt.typesafe.com/"
    components ["main"]
    key "typesafe-repo-public.asc"
  end

  package "sbt" do
    package_name node['sbt']['package']
  end
when "centos", "redhat"
  yum_repository "typesafe" do
    repo_name "typesafe"
    description "Typesafe Repository"
    url "http://rpm.typesafe.com/"
    action :add
  end

  package "sbt" do
    package_name node['sbt']['package']
  end
end