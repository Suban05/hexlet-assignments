# frozen_string_literal: true

class SetLocaleMiddleware
    def initialize(app)
      @app = app
    end

  # BEGIN
  def call(env)
    locale = env['HTTP_ACCEPT_LANGUAGE'] ? env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : nil
    locale ||= I18n.default_locale

    env['rack.locale'] = I18n.locale = locale.to_s
    status, headers, body = @app.call(env)
    headers = {}.merge(headers)

    unless headers['Content-Language']
      headers['Content-Language'] = locale.to_s
    end
    I18n.locale = locale
    [status, headers, body]
  end
  # END
end
