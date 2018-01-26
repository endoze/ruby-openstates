require 'faraday'

module OpenStates
  class Mashify < Faraday::Response::Middleware
    def on_complete(env)
      super if env[:body].is_a? Hash
    end

    def parse(body)
      Mashed.new(body)
    end
  end
end
