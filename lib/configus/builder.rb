
module Configus

  class Builder

	  def initialize(&block)
		  @envs = {}
			instance_eval(&block)
	  end

	  def self.build(&block)
		  b = Builder.new(&block)
      b.config
	  end

	  def env(name, &block)
			@envs[name] = Proxy.build(&block)
		end

    def config
      @envs
    end
  end

end