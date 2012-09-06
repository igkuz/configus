module Configus

  class Proxy

	  def initialize(&block)
		  self.singleton_class.class_eval do
			  def method_missing(name, *args, &block)
					self.class.send(:define_method, name) do
            return args[0]
          end
        end

      end
      instance_eval(&block)
	  end

	  def self.build(&block)
			p = Proxy.new(&block)

	  end

  end

end