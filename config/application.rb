require_relative 'boot'
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module ECommerce
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.stripe.secret_key = "sk_test_51IuVpzLfJJ5w19fSIQTfOTPjHiMY0CnO49DJ91yPa1cBi7WLuSFDfPJuT7bSgN3UDjX6SvAdks2hhIKYVLXw9q2O00jm3t38fA"
    # config/application.rb
# ...
    config.stripe.publishable_key = 'pk_test_51IuVpzLfJJ5w19fSvA8OD4aJU0oz9wghYqjI3HBgRgN8tRvdV28YZgOjakWd0FYz1joQ19sLmAcy5G3IZtPsqNgg00KheoX0iN'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
