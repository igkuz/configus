module Configus

  class Proxy

	  def initialize
		  self.singleton_class.class_eval do
			  def method_missing(name, *args, &block)
					raise name.inspect
			  end
		  end

	  end

	  def self.build(&block)
			p = Proxy.new(&block)

	  end

  end

end