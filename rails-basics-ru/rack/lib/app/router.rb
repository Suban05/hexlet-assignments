# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    request_path = env['PATH_INFO']

    case request_path
    when '/'
      [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
    when '/about'
      [200, { 'Content-Type' => 'text/plain' }, ['About page']]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['404 Not Found']]
    end  
    # END
  end
end
