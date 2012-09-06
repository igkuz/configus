module Configus

  class Proxy

	  def initialize(&block)
		  @hash = {}
      instance_eval(&block)
	  end

	  def self.build(&block)
			p = Proxy.new(&block)
		  p.hash
	  end

	  def method_missing(name, *args, &block)
		  @hash[name] = args[0]
	  end

		def hash
			@hash
		end

  end

end