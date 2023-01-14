require 'httparty'

module Ntfyable
  include HTTParty
  debug_output $stdout

  BASE_URI = ENV.fetch('NTFY_BASE_URL') { raise 'missing base url' }
  TOPIC_NAME = ENV.fetch('NTFY_TOPIC_NAME') { raise 'missing topic name'}

  base_uri BASE_URI

  module ClassMethods
    def base_uri
      self::BASE_URI
    end

    def topic_name
      self::TOPIC_NAME
    end
  end
end
