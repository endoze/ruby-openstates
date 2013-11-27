require 'faraday'

module OpenStates
  class Mashify < Faraday::Response::Middleware
    def on_complete(env)
      super if Hash === env[:body]
    end

    def parse(body)
      Hashie::Mash.new(body)
    end
  end
end
