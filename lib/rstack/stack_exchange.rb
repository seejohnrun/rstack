module RStack

  class StackExchange

    API_VERSION = '0.9'
    
    # Create a new StackExchange object for interacting with the
    # API for a given site
    # +api_host+ The API host to use (ie: 'api.stackoverflow.com')
    def initialize(api_host, api_port = 80)
      @api_host = api_host
      @api_port = api_port
    end
    
    # Get all badges for this StackExchange, in alphabetical order
    def badges
      response = Net::HTTP.get_response(@api_host, "/#{API_VERSION}/badges", @api_port)
      body = inflate_string(response.body)
      # TODO error handling
      JSON.parse(body)['badges'].map { |b| Badge.new(b) }
    end
    
    private

    def inflate_string(string)
      gz = Zlib::GzipReader.new(StringIO.new(string))
      gz.read
    end
    
  end

end
