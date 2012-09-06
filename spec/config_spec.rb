require "spec_helper"

describe Configus::ConfigusConfig do

  it "should be initialised" do
    config = Configus::ConfigusConfig.new :a => "b"
    config.a.should == "b"
  end

  it "should eat nested hashes" do
    config = Configus::ConfigusConfig.new :a => {d: "b"}
    config.a.d.should == "b"
  end

end