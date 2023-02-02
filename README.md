# Reading Ruby Code

Following along Michael Cordell&rsquo;s article
[Reading Ruby Code: ROM - preface](https://blog.mikecordell.com/2017/01/29/reading-ruby-code-rom-preface/).

I am using Visual Studio Code with the
[rebornix.Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)
extension to debug Ruby code. The second paragraph of dependencies supports development-related activities, including [ruby-rubocop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop).

```shell
mkdir ruby-code-reading
cd ruby-code-reading
bundler init
cat <<- EOF >> Gemfile
  gem 'rom', '>= 2.0.0'
  gem 'rom-sql'
  gem 'sqlite3'
  gem 'rom-repository'

  gem 'debase', "0.2.5.beta2", require: false
  gem 'ruby-debug-ide', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
EOF
```

This old-style command has been deprecated:
```shell
$ bundle install --path=vendor
[DEPRECATED] The `--path` flag is deprecated because it relies on being remembered across bundler invocations,
which bundler will no longer do in future versions. Instead please use `bundle config set --local path
'vendor'`, and stop using this flag
```

This is the new style command sequence:
```shell
$ bundle config set --local path 'vendor'
$ bundle install
```
