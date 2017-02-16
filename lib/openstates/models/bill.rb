module OpenStates
  class Bill
    include Model
    hash_attr_accessor :action_dates,
                       :actions,
                       :alternate_titles,
                       :bill_id,
                       :chamber,
                       :created_at,
                       :documents,
                       :id,
                       :level,
                       :scraped_subjects,
                       :session,
                       :session,
                       :sources,
                       :sponsors,
                       :state,
                       :subjects,
                       :subjects,
                       :title,
                       :title,
                       :type,
                       :type,
                       :updated_at,
                       :versions,
                       :votes

    class << self
      def api_method
        :bills
      end

      def id_key
        :id
      end

      def bill_details(state, session, bill_id)
        return if !state || !session || !bill_id

        options = {
          state: state,
          session: session,
          bill_id: bill_id
        }

        response = OpenStates.bills(options)

        from_hash(response)
      end

      def find_by_openstates_id(os_id)
        response = OpenStates.bill(os_id)

        from_hash(response)
      end
    end
  end
end
