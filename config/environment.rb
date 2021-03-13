# Load the rails application
require File.expand_path('../application', __FILE__)

## Initialize the rails application
#AgeOfDiscovery::Application.initialize!

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(File.absolute_path(lib)) unless $LOAD_PATH.include?(File.absolute_path(lib))

require 'aod'
