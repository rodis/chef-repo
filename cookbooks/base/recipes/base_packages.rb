bash "update" do
    code "apt-get -q update"
end

%w{git htop}.each do |package|
  apt_package package do
    action :upgrade
  end
end
