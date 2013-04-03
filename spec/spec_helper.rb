# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Neo4j::Config[:logger_level] = Logger::ERROR
Neo4j::Config[:debug_java] = true
EMBEDDED_DB_PATH = File.join(Dir.tmpdir, "neo4j-wrapper-rspec-db")

def embedded_db
  @@db ||= begin
    FileUtils.rm_rf EMBEDDED_DB_PATH
    db = Java::OrgNeo4jKernel::EmbeddedGraphDatabase.new(EMBEDDED_DB_PATH, Neo4j.config.to_java_map)
    at_exit do
      db.shutdown
      FileUtils.rm_rf EMBEDDED_DB_PATH
    end
    db
  end
end

def new_java_tx(db)
  finish_tx if @tx
  @tx = db.begin_tx
end

def finish_tx
  return unless @tx
  @tx.success
  @tx.finish
  @tx = nil
end

def new_tx
  finish_tx if @tx
  @tx = Neo4j::Transaction.new
end

module TempModel
  @@_counter = 1

  def new(base_class, mixin, &block)
    klass = Class.new(base_class)
    setup(klass, mixin)
    base_class.inherited(klass) if base_class.respond_to?(:inherited) && base_class.to_s != klass.to_s
    klass.class_eval(&block) if block
    klass
  end

  def setup(klass, mixin=nil)
    name = "TestClass_#{@@_counter}"
    @@_counter += 1
    klass.class_eval <<-RUBY
        def self.to_s
          "#{name}"
        end
    RUBY
    klass.send(:include, mixin) unless mixin.nil? || klass.kind_of?(mixin)
    Kernel.const_set(name, klass)
    klass
  end

  extend self
end

def new_node_mixin_class(base_class = Object, &block)
  TempModel.new(base_class, Neo4j::NodeMixin, &block)
end

def new_relationship_mixin_class(base_class = Object, &block)
  TempModel.new(base_class, Neo4j::RelationshipMixin, &block)
end

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Reset the Database on every test run
  config.filter_run_excluding :slow => ENV['TRAVIS'] != 'true'

  config.before(:suite) do
    Neo4j::Config[:storage_path] = File.join(Dir.tmpdir, "neo4j_wrapper_integration_rspec")
    FileUtils.rm_rf Neo4j::Config[:storage_path]
    Dir.mkdir(Neo4j::Config[:storage_path])
  end

  config.after(:suite) do
    Neo4j.shutdown if Neo4j.running?
    FileUtils.rm_rf Neo4j::Config[:storage_path]
  end

  config.before(:all, :type => :mock_db) do
    Neo4j.shutdown
    Neo4j::Core::Database.default_embedded_db= MockDb
    Neo4j.start
  end

  config.after(:all, :type => :mock_db) do
    Neo4j.shutdown
    Neo4j::Core::Database.default_embedded_db = nil
  end
end
