git "checkout emacs configuration" do
  repository "git@github.com:rodis/emacs.git"
  destination "/home/vagrant/.emacs.d"
  revision "thin"
  action :sync
  user "vagrant"
  group "vagrant"
end
