directory "/home/#{node["dev_user"]}/.utils" do
  action :create
  owner node["dev_user"]
  group node["dev_user"]
end
