require 'sprockets'
require 'action_view'
require 'action_view/helpers'

module JqueryTmplRails
  class JqueryTemplate < Tilt::Template
    include ActionView::Helpers::JavaScriptHelper

    @template_prefix = ""

    class << self
      attr_reader :template_prefix

      def template_prefix=(prefix)
        if prefix.length > 0
          prefix = prefix[1, prefix.length - 1] if prefix.start_with?("/")
          prefix += "/" unless prefix.end_with?("/")
        end

        @template_prefix = prefix
      end
    end

    def self.default_mime_type
      'application/javascript'
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      %{jQuery.template("#{template_name(scope)}", "#{escape_javascript data}");}
    end

    private

    def template_name(scope)
      scope.logical_path.sub(self.class.template_prefix, "")
    end
  end
end
