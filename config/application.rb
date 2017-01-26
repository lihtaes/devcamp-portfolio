require_relative 'boot'

require 'rails/all'
require 'dotenv-rails'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevcampPortfolio
  class Application < Rails::Application
    config.eager_load_paths << "#{Rails.root}/lib"
  end
end
