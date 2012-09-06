
module Configus
	autoload :Proxy, 'proxy'

  class Builder

	  def initialize(&block)
			instance_eval(&block)
	  end

	  def self.build(&block)
		  b = Builder.new(&block)
	  end

	  def env(name, &block)
		  p = Proxy.build(&block)
	  end

  end

end