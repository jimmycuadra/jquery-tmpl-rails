require "spec_helper"

describe Sprockets::JqueryTmplProcessor do
  before { described_class.template_prefix = "" }

  let(:environment) do
    environment = Sprockets::Environment.new
    environment.append_path "."
    environment
  end

  it "compiles templates with the .tmpl extension" do
    asset = environment["spec/fixtures/test"]

    asset.to_s.should == <<-TMPL
jQuery.template("spec/fixtures/test", "<div class=\\\"test\\\">{{test}}<\\/div>\\n");
    TMPL
  end

  describe ".template_prefix" do
    it "names templates with the logical path minus the template prefix" do
      described_class.template_prefix = "spec/fixtures"
      asset = environment["spec/fixtures/test"]
      asset.to_s.should include('"test"')
    end

    it "normalizes template prefixes by removing extraneous slashes" do
      described_class.template_prefix = "/spec/fixtures/"
      asset = environment["spec/fixtures/test"]
      asset.to_s.should include('"test"')
    end
  end
end
