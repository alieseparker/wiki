ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegratoinTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
end
