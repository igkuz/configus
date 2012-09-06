require "configus/version"

module Configus
  autoload :Builder, 'configus/builder'
  autoload :Config,  'configus/config'

	def self.version_string
		"Configus version #{Configus::VERSION}"
	end

  def self.build(environment, &block)
    attrs = Builder.build(&block)
  end
end
