require "spec_helper"

describe Sprockets::JqueryTmplProcessor do
  let(:assets) do
    assets = Sprockets::Environment.new
    assets.append_path("spec/fixtures")
    assets
  end

  it "compiles templates with the .tmpl extension" do
    assets["test"].to_s.should == <<-TMPL
jQuery.template("test", "<div class=\\\"test\\\">{{test}}<\\/div>\\n");
    TMPL
  end
end
