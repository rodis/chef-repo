git "checkout liquidprompt tool" do
  repository "https://github.com/nojhan/liquidprompt.git"
  destination "/home/#{node["dev_user"]}/.utils/liquidprompt"
  revision "master"
  action :sync
  user node["dev_user"]
  group node["dev_user"]
end

template "/home/#{node["dev_user"]}/.liquidpromptrc" do
  source "liquidpromptrc.erb"
  owner node["dev_user"]
  group node["dev_user"]
  mode 0644
end

ruby_block "activate liquidprompt" do
  block do
    file = Chef::Util::FileEdit.new("/home/#{node["dev_user"]}/.profile")
    file.insert_line_if_no_match(
      "\n# Enable liquidprompt\nsource ~/.utils/liquidprompt/liquidprompt",
      "\n# Enable liquidprompt\nsource ~/.utils/liquidprompt/liquidprompt"
    )
    file.write_file
  end
end
