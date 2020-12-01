require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AjaxSample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Initialize configuration defaults for originally generated Rails version.
	
   config.middleware.insert_before 0, "Rack::Cors" do
     allow do
        origins 'http://localhost:3000'
        resource(
          '*',
          headers: :any,
          methods: [:get, :patch, :put, :delete, :post, :options]
          )
      end
    end
	
  end
end
