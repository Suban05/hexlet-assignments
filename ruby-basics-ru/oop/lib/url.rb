# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  attr_reader :url, :query_params

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI(url)
    @query_params = parse_query_params(@uri)
  end

  def query_param(key, value = nil)
    query_params[key] || value
  end

  def ==(other)
    host == other.host && query_params == other.query_params && port == other.port
  end

  private

  def parse_query_params(uri)
    query_params = {}
    uri.query&.split('&')&.each do |param|
      k, v = param.split('=')
      query_params[k.to_sym] = v
    end
    query_params
  end
end
# END
