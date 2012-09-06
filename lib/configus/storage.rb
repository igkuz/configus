module Configus

  class Storage

	  def initialize(hash)
		  hash.each do |k, v|
			  if v.instance_of? Hash
			  else
				  singleton_class.class_eval do
					  define_method(k) do
						  v
					  end
				  end
			  end
		  end

	  end
  end

end
