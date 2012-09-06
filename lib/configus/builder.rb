
module Configus

  class Builder

	  def initialize(&block)
			instance_eval(&block)
	  end

	  def self.build(&block)
		  b = Builder.new(&block)
      b.result
	  end

	  def env(name, &block)
      print "calling Proxy.build(&block)...\n"
		  @p = Proxy.build(&block)
	  end

    def result
      @p
    end
  end

end