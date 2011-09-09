require 'sprockets/engines'
require 'tilt'
require 'action_view'
require 'action_view/helpers'
require 'action_view/helpers/javascript_helper'

module Sprockets
  module Jquery
    module Tmpl
      class Processor < Tilt::Template
        include ActionView::Helpers::JavaScriptHelper
        
        def self.default_mime_type
          'application/javascript'
        end
        
        def prepare
        end
        
        def evaluate(scope, locals, &block)
          <<-TMPL
(function($) {
  return $.template(#{scope.logical_path.inspect}, "#{escape_javascript data}");
})(jQuery);
          TMPL
        end
      end
    end
  end
  
  register_engine '.tmpl', ::Sprockets::Jquery::Tmpl::Processor
end