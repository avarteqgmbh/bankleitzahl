# encoding: UTF-8
require 'addressable/uri'
require 'net/http'
require 'uri'


module Bankleitzahl

  class Fetcher

    CURRENT_URL = "http://www.bundesbank.de/Redaktion/DE/Downloads/Kerngeschaeftsfelder/Unbarer_Zahlungsverkehr/Bankleitzahlen/2013_09_08/blz_2013_06_03_txt.txt?__blob=publicationFile"

    def self.current_lines(fetcher_class = HttpFile)
      fetcher_class.fetch(CURRENT_URL)
    end

  end

  class HttpFile

    attr_reader :url

    def self.fetch(url)
      self.new(url).get
    end

    def initialize(url)
      @url = url
    end

    def get
      execute
    end

    private

    def execute(options = {})
      http.read_timeout = 360 # seconds
      http.set_debug_output $stderr if options[:debug]

      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)

      if response.code.to_i == 200
        response.body.force_encoding("ISO-8859-1")
        response.body.encode("UTF-8")
      else
        nil
      end
    rescue Errno::ECONNREFUSED, Addressable::URI::InvalidURIError
      nil
    end

    def http
      @http ||= Net::HTTP.new(uri.host, uri.port)
    end

    def uri
      @uri ||= Addressable::URI.parse(url)
    end
  end
end
