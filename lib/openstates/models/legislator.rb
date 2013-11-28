module OpenStates
  class Legislator
    include Model
    hash_attr_accessor :active,
                       :chamber,
                       :created_at,
                       :district,
                       :email,
                       :first_name,
                       :full_name,
                       :last_name,
                       :leg_id,
                       :middle_name,
                       :offices,
                       :old_roles,
                       :party,
                       :photo_url,
                       :roles,
                       :state,
                       :suffixes,
                       :transparencydata_id,
                       :updated_at,
                       :url

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
