require "configus/version"

module Configus
  autoload :Builder, 'configus/builder'
  autoload :Storage, 'configus/storage'
  autoload :Proxy, 'configus/proxy'

	def self.version_string
		"Configus version #{Configus::VERSION}"
	end

  def self.build(environment, &block)
    @attrs = Builder.build(&block)
  end

	def self.config
		@attrs
	end

end
