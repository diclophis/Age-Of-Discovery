# This file is used by Rack-based servers to start the application.

#require ::File.expand_path('../config/environment',  __FILE__)
#run AgeOfDiscovery::Application

project = File.dirname(File.realpath(__FILE__))
lib = File.join(project, "lib")
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'aod'

use Rack::Static, { :urls => ["/index.js", "/vanilla.css", "/morphdom-umd-2.5.10.js"], :root => 'public' }

run Aod::Application
