# frozen_string_literal: true

module Messaging
  class Configuration
    extend Dry::Configurable

    setting :adapter
    setting :prefix
    setting :host

    def self.set_config(**config)
      config.update(config)
    end
  end
end
