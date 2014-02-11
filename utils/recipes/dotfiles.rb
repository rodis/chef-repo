execute "git init && git remote add origin git@github.com:rodis/dotfiles.git && git pull origin master" do
  cwd "/home/vagrant"
  user "vagrant"
  group "vagrant"
end

ruby_block "source .aliases" do
  block do
    file = Chef::Util::FileEdit.new("/home/vagrant/.profile")
    file.insert_line_if_no_match(
      "\n# Enable aliases\nsource ~/.aliases",
      "\n# Enable aliases\nsource ~/.aliases"
    )
    file.write_file
  end
end
