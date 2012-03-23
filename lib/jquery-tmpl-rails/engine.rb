require "active_support/ordered_options"

module JqueryTmplRails

  class << self
    
    def prefix=(pref)
      if pref.is_a?(String) and pref.length > 0
        pref = pref[1, pref.length - 1] if pref.start_with?("/")
        pref += "/" unless pref.end_with?("/")
      end
      
      @prefix = pref
    end
    
    def prefix
      @prefix || ""
    end
    
    def configure
      yield self
      true
    end
    
  end
  
  class Railtie < Rails::Engine
    initializer "sprockets.jquery_templates", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      
      app.assets.register_engine(".tmpl", JqueryTemplate)
    end
  end
end
