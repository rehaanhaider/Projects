ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  
    # Returns true if a test user is logged in.
    def is_logged_in?
      !session[:user_id].nil?
    end
  
    # Logs in a test user.
    def log_in_as(user)
      session[:user_id] = user.id
      session[:expires_at] = Time.zone.now + 10.minutes
    end
  end
