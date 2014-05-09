source 'https://rubygems.org'

gem 'rails', '4.0.2'

#gem 'jruby-openssl'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
end

# To use jquery
# gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do
  gem "poltergeist"
  gem "rake"
  gem "rspec-rails"
end

#gem "neo4j", ">= 2.2.3"
gem 'neo4j', git: 'git://github.com/andreasronge/neo4j.git', branch: 'master'
gem 'devise'
gem "devise-neo4j", :git => 'git://github.com/KieranLafferty/devise-neo4j.git' #:git => 'git://github.com/cfitz/devise-neo4j.git', :branch => 'devise2' #:git => 'git://github.com/andreasronge/devise-neo4j.git'
gem "krypt", :git => 'git://github.com/krypt/krypt'

platforms :jruby do
  gem 'neo4j-community', '~> 2.0.0'
end
