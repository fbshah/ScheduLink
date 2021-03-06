require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module ScheduLink
  class Application < Rails::Application
     config.autoload_paths += %W(#{config.root}/lib)
        config.generators do |g|
      g.test_framework :rspec,
        fixtures:         true,
        view_specs:       false,
        helper_specs:     false,
        routing_specs:    false,
        controller_specs: true,
        request_specs:    true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.

    config.active_record.raise_in_transactional_callbacks = true
       ActionMailer::Base.smtp_settings = {
      address: "smtp.gmail.com", #this is you remote mail server, if you do not specify it rails will use 
      port: 587, # the port at which mail server is running, for local host it is at 25
      domain: "example.com", # just giving a domain name to you smtp server, you can use any name
      authentication: "plain", # If your mail server requires authentication, you need to specify 
      enable_starttls_auto: true,
      user_name: "rashidrubyrails@gmail.com",
      password:  "password77"
    }

    Time::DATE_FORMATS[:default] = "%I:%M %p"
  end
end
