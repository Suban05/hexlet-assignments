# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      hostname = 'https://rails-collective-blog-ru.hexlet.app'
      
      uri = URI(hostname)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      uri = URI("#{hostname}/users/sign_up")
      response = Net::HTTP.get_response(uri)
      cookie = response.response['set-cookie'].split('; ')[0]

      html = Nokogiri::HTML(response.body)
      
      token = html.at('input[@name="authenticity_token"]')['value']
      
      params = {
        'name': "Jon",
        'email': "jon@example.com",
        'authenticity_token': token
      }
      
      request = Net::HTTP::Post.new URI.join(hostname, '/users')
      request.body = URI.encode_www_form(params)
      # Добавляем куки в запрос
      request['Cookie'] = cookie
      
      response = http.request request
      response      
      # END
    end
  end
end
