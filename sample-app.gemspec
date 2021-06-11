# coding: utf-8
Gem::Specification.new do |s|
  s.name = 'sample-app'
  s.version = '1.0.0'
  s.date        = '2021-06-11'
  s.authors = ['zengfen']
  s.email = ['fenfenlehe@163.com']
  s.homepage = ''
  s.summary = 'sample app'
  s.description = 'sample app test'
  s.license = 'MIT'
  s.require_paths = %w(lib) # 把 lib 文件夹添加到 load path 中

  s.files = `git ls-files`.split("\n")
  # s.files       = ["lib/crowdSystem.rb", "lib/crowdSysAction.rb","lib/crowdSysENV.rb","rake/Rakefile","rake/startTest.ini","rake/startTest.rb","testcase/testCase_checkList.txt"]
  s.test_files = `git ls-files -- spec/*`.split("\n")
end