require "configus/version"
require 'configus/core_ext/hash'

module Configus
  autoload :Builder, 'configus/builder'
  autoload :Storage, 'configus/storage'
  autoload :Proxy, 'configus/proxy'

	def self.version_string
		"Configus version #{Configus::VERSION}"
	end

  def self.build(environment, &block)
    @attrs = Builder.build(&block)
    #Storage.new attrs
  end

  def self.config
    @attrs
  end
end
