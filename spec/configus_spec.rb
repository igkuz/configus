require "spec_helper"

describe Configus do
	it "should return correct version string" do
		Configus.version_string.should == "Configus version #{Configus::VERSION}"
	end
end