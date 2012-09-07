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

	  def env(name, hash = {}, &block)
			@envs[name] = Proxy.build(&block)
      if !hash.empty?
        accum = @envs[hash[:parent]]
        @envs[name] = accum.merge_recursive @envs[name]
      else
        @envs[name]
      end
		end

    def config
      @envs
    end
  end

end