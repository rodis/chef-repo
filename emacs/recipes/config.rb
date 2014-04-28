git "checkout emacs configuration" do
  repository "https://github.com/rodis/emacs.git"
  destination "/home/vagrant/.emacs.d"
  revision "thin"
  action :sync
  user "vagrant"
  group "vagrant"
end

template "/tmp/elget_bootstrap.el" do
  source "elget_bootstrap.erb"
  owner "vagrant"
  group "vagrant"
  mode 0644
end

execute "su vagrant -l -c 'emacs --batch -q -l /tmp/elget_bootstrap.el'" do
  cwd "/home/vagrant"
end
