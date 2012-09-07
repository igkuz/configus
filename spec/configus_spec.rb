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

    configus.port.should == 80
    configus.timeout.should == 300
    configus.address.should == "example.com"
    configus.test_symbol.should == :test
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

		configus.port.first_byte.should == 8
	end

	it "should work with inheritance" do
		Configus.build :test do
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

			env :test, :parent => :development do
				address "testCom"
			end

		end

			configus.address.should == "testCom"
			configus.timeout.should == 4000
      configus.port.first_byte.should == 8
      configus.keys.should == [:port, :timeout, :address, :test_symbol]
  end

  it "should raise KeyNotFoundException on unknown key" do
    Configus.build :prod do
      env :prod do
        mail "test@test.fr"
      end
    end

    lambda { configus.mial }.should raise_error(Configus::Storage::KeyNotFoundException)
  end

  it "should work like normal hash" do
    Configus.build :prod do
      env :prod do
        mail "test@test.fr"
      end
    end

    configus[:mail].should == "test@test.fr"
  end

end