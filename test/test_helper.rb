ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    # Helper method to create a user
    def create_user(email: "test@example.com", password: "password")
      User.create!(email_address: email, password: password)
    end

    # Helper method to log in a user
    def log_in_as(user, password: "password")
      post session_url, params: {
        email_address: user.email_address,
        password: password
      }
      assert_response :redirect
      follow_redirect!
    end

    # Helper method to log out a user
    def log_out
      delete session_url
    end
  end
end
