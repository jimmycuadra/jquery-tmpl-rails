module JqueryTmplRails
  class Railtie < Rails::Railtie
    initializer "sprockets.jquery_templates", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".tmpl", JqueryTemplate)
    end
  end
end
