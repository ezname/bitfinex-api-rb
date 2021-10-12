module Bitfinex
  module Configurable
    def self.included(base)
      base.extend(ClassMethods)
    end

    def config
      self.class.config
    end

    module ClassMethods
      def configure
        yield config
      end

      def config
        @configuration ||= Configuration.new
      end
    end
  end

  class Configuration
    attr_accessor :api_endpoint, :debug, :debug_connection, :secret
    attr_accessor :api_key, :websocket_api_endpoint, :rest_timeout
    attr_accessor :reconnect, :reconnect_after, :rest_open_timeout

    def initialize
      self.api_endpoint = "https://api.bitfinex.com/v1/"
      self.websocket_api_endpoint = "wss://api.bitfinex.com/ws"
      self.debug = false
      self.reconnect = true
      self.reconnect_after = 60
      self.rest_timeout = 30
      self.rest_open_timeout = 30
      self.debug_connection = false
    end
  end

end
