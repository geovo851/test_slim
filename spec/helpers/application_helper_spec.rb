require 'rails_helper'

describe ApplicationHelper do

  describe "#bootstrap_class_for" do

    context "should include alert-success" do
      it { expect(bootstrap_class_for("success")).to match(/alert-success/) }
    end

    context "should include alert" do
      it { expect(bootstrap_class_for("notice")).to match(/^alert/) }
    end

    context "should not include alert" do
      it { expect(bootstrap_class_for("hello")).not_to match(/alert/) }
    end

  end
end