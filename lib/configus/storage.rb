module Configus

  class Storage

    class KeyNotFoundException < RuntimeError
    end

	  def initialize(hash)
      @hash = hash
		  hash.each do |k, v|
        singleton_class.class_eval do
          result = if v.instance_of? Hash
            Storage.new v
          else
            v
          end

          define_method(k) do
            result
          end
        end
		  end
    end

    def [](key)
      to_hash[key]
    end

    def keys
      @hash.keys
    end

    def to_hash
      @hash
    end

    def method_missing(name, *args, &block)
      raise KeyNotFoundException.new name
    end
  end

end
