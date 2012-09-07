require "spec_helper"

describe Configus do
	it "should return correct version string" do
		Configus.version_string.should == "Configus version #{Configus::VERSION}"
  end

  it "should work as key-value storage" do
    Configus.build :production do
      env :production do
        port 80
        timeout 300
        address "example.com"
        test_symbol :test
      end
    end

    configus.production.port.should == 80
    configus.production.timeout.should == 300
    configus.production.address.should == "example.com"
    configus.production.test_symbol.should == :test
  end

	it "should work with nesting" do
		Configus.build :production do
			env :production do
				port do
					first_byte 8
				end
				timeout 300
				address "example.com"
				test_symbol :test
			end
		end

		configus.production.port.first_byte.should == 8
	end

	it "should work with inheritance" do
		Configus.build :production do
			env :production do
				port do
					first_byte 8
				end
				timeout 300
				address "example.com"
				test_symbol :test
			end

			env :development, :parent => :production do
				timeout 4000
			end

		end

			configus.development.address.should == "example.com"
			configus.production.timeout.should == 300
	end

end