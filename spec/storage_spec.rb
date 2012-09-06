require "spec_helper"

describe Configus::Storage do

	it "should be initialised" do
		config = Configus::Storage.new :a => "b"
		config.a.should == "b"
	end

	it "should eat nested hashes" do
		config = Configus::Storage.new :a => {d: "b"}
		config.a.d.should == "b"
	end

	it "should be initialised by nested nested ... hashes" do
		hash  = {
				:a => {
						:b => {
								:c => "d"
						}
				}
		}
		config = Configus::Storage.new(hash)
		config.a.b.c.should == "d"
	end

end