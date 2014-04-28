apt_package 'python-software-properties' do
  action :upgrade
end

bash "add-emacs-24" do
    code "add-apt-repository -y ppa:cassou/emacs; apt-get update"
end

%w{emacs24 emacs24-el emacs24-common-non-dfsg texinfo}.each do |package|
  apt_package package do
    action :upgrade
  end
end
