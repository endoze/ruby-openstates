module OpenStates
  class Committee
    include Model
    hash_attr_accessor :chamber,
                       :committee,
                       :created_at,
                       :id,
                       :members,
                       :parent_id,
                       :sources,
                       :state,
                       :subcommittee,
                       :updated_at

    class << self
      def api_method
        :committees
      end

      def id_key
        :committee_id
      end
    end
  end
end
