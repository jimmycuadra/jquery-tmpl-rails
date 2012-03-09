require 'sprockets'
require 'sprockets/engines'
require 'tilt'
require 'action_view'
require 'action_view/helpers'

module Sprockets
  class JqueryTmplProcessor < Tilt::Template
    include ActionView::Helpers::JavaScriptHelper

    def self.default_mime_type
      'application/javascript'
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      <<-TMPL
jQuery.template(#{scope.logical_path.inspect}, "#{escape_javascript data}");
        TMPL
    end
  end

  register_engine '.tmpl', JqueryTmplProcessor
end
