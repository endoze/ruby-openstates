module OpenStates
  module Connection
    BASE_URL = 'http://openstates.org/api/v1/'
    def connection
      @connection ||= begin
        conn = Faraday.new(BASE_URL) do |b|
          b.response :logger
          b.use Mashify
          b.use FaradayStack::ResponseJSON, content_type: 'application/json'
          b.use FaradayStack::Caching, cache, strip_params: %w[apikey] unless cache.nil?
          b.response :raise_error
          b.adapter Faraday.default_adapter
        end

        conn.params['apikey'] = api_key unless api_key.nil?

        conn
      end
    end

    def get(path, params = nil)
      connection.get(path) do |request|
        puts "Requesting: #{path}"
        request.params = params if params
      end
    end
  end
end
