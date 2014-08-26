require 'uri'
require 'net/http'
require 'openssl'

module Primecontext

  class Api
    attr_reader :options

    def initialize(options = {})
      @options = Primecontext::default_options.merge(options)
    end

    def new_record(data = {})
      data.merge!({ 'sign' => generate_sign(data) })
      send_request(data)
    end

    def generate_sign(data)
      data_str = data.sort.join.downcase
      digest = OpenSSL::Digest.new 'sha256'
      OpenSSL::HMAC.hexdigest digest, @options[:secret_key], data_str
    end

    def send_request(data)
      uri = URI.parse(@options[:api_url])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.request_post(uri.request_uri, URI.encode_www_form(data))
    end
  end

end
