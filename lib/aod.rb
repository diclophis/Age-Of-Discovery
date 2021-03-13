require 'sinatra'
require 'markaby'
require 'neo4j'

#if defined?(Bundler)
#  # If you precompile assets before deploying to production, use this line
#  #Bundler.require(*Rails.groups(:assets => %w(development test)))
#  # If you want your assets lazily compiled in production, use this line
#  Bundler.require(:default, :assets, :development, :test)
#end

#require 'active_graph/rake_tasks'

module Aod
  VERSION = "0.1.0"

  autoload 'Application', 'aod/application'
  autoload 'Models', 'aod/models'
end
