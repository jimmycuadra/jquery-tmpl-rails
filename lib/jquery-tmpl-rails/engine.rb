require "active_support/ordered_options"

module JqueryTmplRails
  class Railtie < Rails::Engine
    config.jquery_templates = ActiveSupport::OrderedOptions.new
    config.jquery_templates.prefix = ""

    initializer "sprockets.jquery_templates", group: :all do |app|
      app.config.assets.configure do |asset|
        asset.register_engine ".tmpl", JqueryTemplate
      end
    end
  end
end
