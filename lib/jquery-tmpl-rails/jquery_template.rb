require 'sprockets'
require 'action_view'
require 'action_view/helpers'
require 'tilt'

module JqueryTmplRails
  class JqueryTemplate < Tilt::Template
    include ActionView::Helpers::JavaScriptHelper
    
    def self.default_mime_type
      'application/javascript'
    end
    
    def evaluate(scope, locals, &block)
      %{jQuery.template("#{template_name(scope)}", "#{escape_javascript(data)}");}
    end
    
    def prepare
    end
    
    private
    
    def template_name(scope)
      scope.logical_path.sub(JqueryTmplRails.prefix, "")
    end
  end
end
