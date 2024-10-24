# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    if status != 404
      [status, headers, body << Digest::SHA2.hexdigest(body.first)]
    else
      [status, headers, body]
    end
    # END
  end
end
