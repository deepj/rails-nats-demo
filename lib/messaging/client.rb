# frozen_string_literal: true

require 'nats/io/client'

module Messaging
  class Client
    extend Forwardable

    def_delegators :@nats, :connected?, :connecting?, :flush, :subscribe, :close

    def self.current
      @current ||= Concurrent::Map.new
      puts "Processs #{Process.pid}"
      @current[Process.pid] ||= new.connect
    end

    def self.connection_pool
      @current
    end

    def self.current=(connection)
      @current[Process.pid] = connection
    end

    def self.establish_connection
      current&.flush
      current&.close
      current = new.connect
    end

    def connect
      puts "connected in process #{Process.pid}"
      @nats = NATS::IO::Client.new
      @nats.on_error      { |e| Rails.logger.error("NATS Error: #{e}") }
      @nats.on_reconnect  { Rails.logger.info("NATS reconnect") }
      @nats.on_disconnect { Rails.logger.info("NATS disconnect") }
      @nats.connect(Configuration.config.host)
      @nats
    end
  end
end
