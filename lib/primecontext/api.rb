require 'uri'
require 'net/http'
require 'openssl'

module Primecontext

  class Api
    attr_reader :options, :data

    def initialize(options = {})
      @options = Primecontext::default_options.merge(options)
      @data = { user_id: @options[:user_id] }
    end

    def new_record(data = {})
      @data = @data.merge(Hash[data.map{ |(k,v)| [k.to_sym, v] }])
      @data.merge!({ sign: generate_sign(@data) })
      send_request(@data)
    end

    def generate_sign(data)
      data_str = data.sort.join.mb_chars.downcase
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
