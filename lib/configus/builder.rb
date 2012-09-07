module Configus

  class Builder

    class ParentEnvironNotFound < EnvironNotFound
    end

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
        raise ParentEnvironNotFound unless @envs.has_key? name
        accum = @envs[hash[:parent]]
        @envs[name] = accum.deep_merge @envs[name]
      else
        @envs[name]
      end
		end

    def config
      @envs
    end
  end

end