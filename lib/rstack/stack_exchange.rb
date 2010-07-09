module RStack

  class StackExchange

    attr_reader :api_host, :api_port
    
    # Create a new StackExchange object for interacting with the
    # API for a given site
    # +api_host+ The API host to use (ie: 'api.stackoverflow.com')
    def initialize(api_host, api_port = 80)
      @api_host = api_host
      @api_port = api_port
    end
    
    # Get all badges for this StackExchange, in alphabetical order
    def badges
      mediator = StackMediator.new(self, '/badges')
      mediator.json['badges'].map { |b| Badge.new(b) }
    end
    
    def moderators(options = {})
      mediator = StackMediator.new(self, '/users/moderators', options)
      mediator.json['users'].map { |u| User.new(u) }
    end
    
  end

end
