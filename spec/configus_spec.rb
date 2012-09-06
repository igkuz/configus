require "spec_helper"

describe Configus do
	it "should return correct version string" do
		Configus.version_string.should == "Configus version #{Configus::VERSION}"
  end

  it "should work as key-value storage" do
    configus = Configus.build :production do
      env :production do
        port 80
        timeout 300
        address "example.com"
        test_symbol :test
      end
    end

    configus.port.should == 80
    configus.timeout.should == 300
    configus.address.should == "example.com"
    configus.test_symbol.should == :test
  end

	it "should work with nesting" do
		configus = Configus.build :production do
			env :production do
				port do
					first_byte 8
				end
				timeout 300
				address "example.com"
				test_symbol :test
			end
		end

		configus.port.first_byte.should == 8
	end

end