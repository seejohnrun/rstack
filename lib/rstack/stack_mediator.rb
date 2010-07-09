module RStack

  class StackMediator

    API_VERSION = '0.9'

    attr_reader :json
    
    def initialize(exchange, partial_path, options = {})
      full_path = "/#{API_VERSION}#{partial_path}"
      full_path << "?#{param_string(options)}" if options
      response = Net::HTTP.get_response(exchange.api_host, full_path)
      body = inflate_string(response.body)
      # TODO error handling expansion
      @json = JSON.parse(body)
    end
    
    private

    def inflate_string(string)
      gz = Zlib::GzipReader.new(StringIO.new(string))
      gz.read
    end

    def param_string(hash)
      str = ''
      hash.each { |k, v| str << "#{k}=#{v}&" }
      str.chop!
      str
    end

  end

end
