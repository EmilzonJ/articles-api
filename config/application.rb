require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ArticlesApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.i18n.default_locale = :es
    config.i18n.fallbacks = [:en]

    config.api_only = true

    config.generators do |g|
      g.test_framework(
        :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
      )
    end
  end
end
