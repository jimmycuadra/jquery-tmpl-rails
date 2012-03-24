require "active_support/ordered_options"

module JqueryTmplRails
  class Railtie < Rails::Engine
    config.jquery_templates = ActiveSupport::OrderedOptions.new
    config.jquery_templates.prefix = ""

    initializer "sprockets.jquery_templates", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".tmpl", JqueryTemplate)
    end
  end
end
