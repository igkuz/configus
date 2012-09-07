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
		lambda {config.a.c}.should raise_error
  end

  it "should give out source hash" do
    hash  = {
        :a => {
            :b => {
                :c => "d"
            }
        }
    }

    config = Configus::Storage.new(hash)

    config.to_hash.should == hash
  end

end