execute "git init && git remote add origin git@github.com:rodis/dotfiles.git && git pull origin master" do
  cwd "/home/#{node["dev_user"]}"
  user node["dev_user"]
  group node["dev_user"]
end

ruby_block "source .aliases" do
  block do
    file = Chef::Util::FileEdit.new("/home/#{node["dev_user"]}/.profile")
    file.insert_line_if_no_match(
      "\n# Enable aliases\nsource ~/.aliases",
      "\n# Enable aliases\nsource ~/.aliases"
    )
    file.write_file
  end
end
