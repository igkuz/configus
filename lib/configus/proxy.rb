module Configus

  class Proxy

	  def initialize(&block)
		  singleton_class.class_eval(&block) do
		  end

	  end

	  def self.build(&block)
			p = Proxy.new(&block)

	  end

  end

end