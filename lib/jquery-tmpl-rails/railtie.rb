require "active_support/ordered_options"

module JqueryTmplRails
  class Railtie < Rails::Railtie
    initializer "sprockets.jquery_templates", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets

      app.assets.register_engine(".tmpl", JqueryTemplate)
      app.config.jquery_templates = ActiveSupport::OrderedOptions.new
      app.config.jquery_templates.prefix = ""
    end
  end
end
