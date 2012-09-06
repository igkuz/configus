require "spec_helper"

describe Configus::Storage do

	it "should be initialised" do
		config = Configus::Storage.new :a => "b"
		config.a.should == "b"
	end

end