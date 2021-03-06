require "configus/version"
require 'configus/core_ext/kernel'
require 'active_support/core_ext/hash'

module Configus
  autoload :Builder, 'configus/builder'
  autoload :Storage, 'configus/storage'
  autoload :Proxy, 'configus/proxy'

  class EnvironNotFound < RuntimeError
  end

	def self.version_string
		"Configus version #{Configus::VERSION}"
	end

  def self.build(environment, &block)
    @attrs = Builder.build(environment, &block)
    @storage = Storage.new @attrs[environment]
  end

  def self.config
    @storage
  end
end
