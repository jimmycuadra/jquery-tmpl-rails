require "spec_helper"

describe JqueryTmplRails::JqueryTemplate do
  before { Rails.application.assets.cache = {} }

  it "compiles templates with the .tmpl extension" do
    template = Rails.application.assets["templates/test"]
    template.to_s.should == %{jQuery.template("templates/test", "<div class=\\\"test\\\">{{test}}<\\/div>\\n");}
  end

  context "when config.template_prefix is set" do
    it "removes the prefix from the template name" do
      Rails.configuration.jquery_templates.prefix = "templates"
      template = Rails.application.assets["templates/test"]
      template.to_s.should include('"test"')
    end

    it "normalizes template prefixes by removing extraneous slashes" do
      Rails.configuration.jquery_templates.prefix = "/templates/"
      template = Rails.application.assets["templates/test"]
      template.to_s.should include('"test"')
    end
  end
end
