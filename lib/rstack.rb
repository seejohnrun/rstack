module RStack

  require 'json'
  require 'net/http'
  require 'zlib'

  require 'rstack/stack_mediator'
  require 'rstack/stack_exchange'
  
  autoload :User, 'rstack/user'
  autoload :Badge, 'rstack/badge'
  
end
