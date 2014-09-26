git "checkout git hook tool" do
  repository "https://github.com/icefox/git-hooks.git"
  destination "/home/#{node["dev_user"]}/.utils/git-hooks"
  revision "master"
  action :sync
  user node["dev_user"]
  group node["dev_user"]
end

git_hooks = "/home/#{node["dev_user"]}/.git_hooks"
commit_msg = "#{git_hooks}/commit-msg"

directory git_hooks do
  owner node["dev_user"]
  group node["dev_user"]
  mode 0755
end

directory commit_msg do
  owner node["dev_user"]
  group node["dev_user"]
  mode 0755
end

template "#{commit_msg}/add-change-id" do
  source "add-change-id.erb"
  owner node["dev_user"]
  group node["dev_user"]
  mode 0644
end

ruby_block "activate git_hook" do
  block do
    file = Chef::Util::FileEdit.new("/home/#{node["dev_user"]}/.profile")
    file.insert_line_if_no_match(
      "\n# Enable git-hook\nexport PATH=~/.utils/git-hooks:$PATH",
      "\n# Enable git-hook\nexport PATH=~/.utils/git-hooks:$PATH"
    )
    file.write_file
  end
end
