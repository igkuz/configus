require "spec_helper"

describe Configus::Builder do

	before do
		block = Proc.new do
			env :production do
				website_url 'http://example.com'
				email do
					pop do
						address 'pop.example.com'
						port    110
					end
					smtp do
						address 'smtp.example.com'
						port    25
					end
				end
			end
		end
		@hash = Configus::Builder.build(&block)
	end

	it "should build hash for nested blocks" do
		@hash.should == {
			:production => {
					:website_url => "http://example.com",
					:email => {
						:pop => {
							:address => "pop.example.com",
							:port => 110
						},
						:smtp => {
							:address => "smtp.example.com",
							:port => 25
						}
					}
			}
		}
	end

end