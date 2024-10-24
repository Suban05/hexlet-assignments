# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, header, body = @app.call(env)
    if Rack::Request.new(env).path.include? '/admin'
      [403, {}, []]
    else
      [status, header, body]
    end
    # END
  end
end
