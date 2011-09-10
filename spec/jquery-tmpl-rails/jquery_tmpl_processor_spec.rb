require "spec_helper"

describe Sprockets::JqueryTmplProcessor do
  before(:all) do
    @assets = Sprockets::Environment.new
    @assets.append_path "spec/fixtures"
  end

  it "compiles templates with the .tmpl extension" do
    @assets["test"].to_s.should == <<-TMPL
;(function($) {
  return $.template("test", "<div class=\\\"test\\\">{{test}}<\\/div>\\n");
})(jQuery);
    TMPL
  end
end
