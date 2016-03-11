require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MediaCollection
  class Application < Rails::Application
    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru
  end
end
