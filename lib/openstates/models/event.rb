module OpenStates
  class Event
    include Model
    hash_attr_accessor :created_at,
                       :description,
                       :documents,
                       :end,
                       :id,
                       :location,
                       :participants,
                       :related_bills,
                       :sources,
                       :state,
                       :timezone,
                       :type,
                       :updated_at,
                       :when
    class << self
      def api_method
        :events
      end

      def id_key
        :event_id
      end
    end
  end
end
