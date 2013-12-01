module OpenStates
  class District
    include Model
    hash_attr_accessor :abbr,
                       :bbox,
                       :boundary_id,
                       :center_lat,
                       :center_lon,
                       :chamber,
                       :id,
                       :lat_delta,
                       :lon_delta,
                       :name,
                       :num_seats,
                       :region,
                       :shape

    class << self
      def api_method
        :districts
      end

      def id_key
        :boundary_id
      end

      def find(boundary_id)
        return if !boundary_id

        response = OpenStates.district_boundaries(boundary_id)

        from_hash(response)
      end
    end
  end
end
