ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('ABORT! Production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
require 'factory_girl'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'faker'

def zeus_running?
  File.exist? 'zeus.sock'
end

unless zeus_running?
  require 'simplecov'
  SimpleCov.start 'rails'
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  # config.include Devise::TestHelpers, type: :controller
  # config.extend ControllerMacros, type: :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all) { DeferredGarbageCollection.reconsider }

  config.around(:each, type: :feature, js: true) do |example|
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    self.use_transactional_fixtures = false
    example.run
    self.use_transactional_fixtures = true
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

Capybara.javascript_driver = :poltergeist
