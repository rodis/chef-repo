git "checkout liquidprompt tool" do
  repository "https://github.com/nojhan/liquidprompt.git"
  destination "/home/vagrant/.utils/liquidprompt"
  revision "master"
  action :sync
  user 'vagrant'
  group'vagrant'
end

template "/home/vagrant/.liquidpromptrc" do
  source "liquidpromptrc.erb"
  owner "vagrant"
  group "vagrant"
  mode 0644
end

ruby_block "activate liquidprompt" do
  block do
    file = Chef::Util::FileEdit.new("/home/vagrant/.profile")
    file.insert_line_if_no_match(
      "\n# Enable liquidprompt\nsource ~/.utils/liquidprompt/liquidprompt",
      "\n# Enable liquidprompt\nsource ~/.utils/liquidprompt/liquidprompt"
    )
    file.write_file
  end
end
