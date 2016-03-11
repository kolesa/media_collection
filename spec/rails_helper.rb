ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.default_wait_time = 60

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|


  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.include Warden::Test::Helpers
  config.before :each do
    Warden.test_mode!
  end
  config.after :each do
    Warden.test_reset!
  end

  config.include FactoryGirl::Syntax::Methods
  config.include SpecHelper
end
