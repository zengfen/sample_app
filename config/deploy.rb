# 最顶上加这行，注意是「`」号而不是单引号「'」
# 如果你对ssh-add有兴趣，你可以去读这一篇。https://ihower.tw/blog/archives/7837
`ssh-add`

# 项目名称
set :application, "sample_app_cap"

# git仓库地址
set :repo_url, "git@github.com:zengfen/sample_app.git"

# 需要部署到服务器的位置
set :deploy_to, "/Users/zengfen/xjgreat/learn/learn_ruby/sample_app_cap"

# 去掉注释，并加上 "config/secrets.yml"
append :linked_files, "config/database.yml", "config/secrets.yml"

# 去掉注释
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'