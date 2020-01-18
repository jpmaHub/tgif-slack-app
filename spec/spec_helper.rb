require 'database_cleaner'
require 'date'
require 'rack/test'
require 'sinatra'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../lib/")
loader.setup

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  def app
    TgifService
  end
end

class TgifStub
  def initialize(id, team_name, message)
    @id = id
    @team_name = team_name
    @message = message
  end

  attr_reader :id, :team_name, :message, :slack_user_id
end


RSpec.configure do |config|
  config.include RSpecMixin
  config.include Rack::Test::Methods
  config.run_all_when_everything_filtered

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }

  config.before(:each) { DatabaseCleaner.strategy = :transaction }

  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }

  config.before(:each) { DatabaseCleaner.start }

  config.after(:each) { DatabaseCleaner.clean }

  config.before(:all) { DatabaseCleaner.start }

  config.after(:all) { DatabaseCleaner.clean }
end