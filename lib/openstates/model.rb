module OpenStates
  module Model
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def from_hash(hash)
        instance = new
        instance.populate_from_hash!(hash)
        yield instance if block_given?
        instance
      end

      def hash_attr_accessor(*symbols)
        attr_writer(*symbols)
        symbols.each do |symbol|
          define_method(symbol) do
            instance_variable_get("@#{symbol}")
          end
        end
      end

      def find(id)
        return if !id

        id_hash = {}
        id_hash[id_key] = id
        response = OpenStates.send(api_method, id_hash)

        from_hash(response)
      end

      def where(options = {})
        return [] if options.empty?

        OpenStates.send(api_method, options).map do |leg_hash|
          from_hash(leg_hash)
        end
      end

      def api_method
        raise NotImplementedError
      end

      def id_key
        raise NotImplementedError
      end
    end

    def populate_from_hash!(hash)
      return unless hash

      hash.each do |key, value|
        next if value.nil?

        set_attr_method = "#{key}="

        __send__(set_attr_method, value) if respond_to?(set_attr_method)
      end
    end
  end
end
