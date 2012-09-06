require "spec_helper"

describe Configus::ConfigusConfig do

	it "should be initialised" do
		config = Configus::ConfigusConfig.new :a => "b"
		config.a.should == "b"
	end

end