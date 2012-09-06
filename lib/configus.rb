require "configus/version"

module Configus
  autoload :Builder, 'configus/builder'
  autoload :Config,  'configus/config'

	def self.version_string
		"Configus version #{Configus::VERSION}"
	end

  def self.build name
    storage = ConfigusStorage.new

    storage.instance_eval do
      yield
    end
  end
end
