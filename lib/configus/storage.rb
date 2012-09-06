module Configus

  class Storage

	  def initialize(hash)
		  hash.each do |k, v|
        singleton_class.class_eval do
          result = if v.instance_of? Hash
            ConfigusConfig.new v
          else
            v
          end

          define_method(k) do
            result
          end
        end
		  end
	  end
  end

end
