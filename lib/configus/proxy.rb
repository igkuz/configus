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
			if args.empty? && block_given?
				@hash[name] = Proxy.build(&block)
			else
				@hash[name] = args[0]
			end

		end

		def hash
			@hash
		end

  end

end