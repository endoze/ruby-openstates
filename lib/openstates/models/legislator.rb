module OpenStates
  class Legislator
    include Model
    hash_attr_accessor :leg_id,
                       :state,
                       :active,
                       :chamber,
                       :district,
                       :party,
                       :email,
                       :full_name,
                       :first_name,
                       :middle_name,
                       :last_name,
                       :suffixes,
                       :photo_url,
                       :url,
                       :created_at,
                       :updated_at,
                       :transparencydata_id

    class << self
      def api_method
        :legislators
      end

      def id_key
        :leg_id
      end

      def by_location(lat, lon)
        return if !lat || !lon

        response = OpenStates.geo_legislators(lat, lon)

        response.map do |leg_hash|
          from_hash(leg_hash)
        end
      end
    end
  end
end
