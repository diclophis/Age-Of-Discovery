#

require 'active_graph'
require 'sinatra'
require 'sinatra/cookies'
require 'markaby'

lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(File.absolute_path(lib)) unless $LOAD_PATH.include?(File.absolute_path(lib))
require 'aod'

locales_glob = File.absolute_path(File.join('config', 'locales', '*.yml'))

I18n.load_path << Dir[locales_glob]

ActiveGraph::Base.driver = Neo4j::Driver::GraphDatabase.driver(
  ENV['NEO4J_AT'] || "bolt://#{ENV['NEO4J_FULLA_SERVICE_HOST']}:7687", #'bolt://10.99.111.86:7687',
  Neo4j::Driver::AuthTokens.basic('neo4j', 'password'),
  encryption: false
)

$APPLICATION_UUID = SecureRandom.hex
