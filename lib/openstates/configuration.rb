module OpenStates
  module Configuration
    attr_accessor :api_key, :cache

    def configure
      yield self
    end
  end
end
