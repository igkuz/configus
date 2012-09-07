module Configus

  class Builder

    class ParentEnvironNotFound < EnvironNotFound
    end

	  def initialize(&block)
		  @envs = {}
			instance_eval(&block)
	  end

	  def self.build(name, &block)
		  config = Builder.new(&block).config

      raise EnvironNotFound unless config.has_key? name

      config
	  end

	  def env(name, hash = {}, &block)
      @envs[name] = Proxy.build(&block)
      if hash.any?
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