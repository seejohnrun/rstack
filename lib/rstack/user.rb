module RStack

  class User

    include Comparable
    
    attr_reader :display_name, :user_id
    
    def initialize(exchange, u)
      @exchange = exchange
      @display_name = u['display_name']
      @user_id = u['user_id']
    end

    def <=>(other)
      self.user_id - other.user_id
    end
    
    # find a user or group of users by id
    def self.find(exchange, ids = [])
      if ids.is_a?(Enumerable)
        json = StackMediator.new(exchange, "/users/#{ids.join(';')}").json
        json['users'].map { |u| User.new(u) }
      else
        json = StackMediator.new(exchange, "/users/#{ids}").json
        User.new json
      end
    end
    
  end

end
