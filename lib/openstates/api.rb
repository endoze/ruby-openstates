module OpenStates
  module Api
    def metadata(state = nil)
      url = "metadata/"
      url << "#{state}/" if state
      get(url)
    end

    def bills(options = {})
      url = "bills/"
      if options[:state] && options[:session] && options[:bill_id]
        url << "#{options[:state]}/#{options[:session]}/#{options[:bill_id]}/"
        [:state, :session, :bill_id].each do |key|
          options.delete(key)
        end
      end

      if options[:id]
        url << "#{options[:id]}/"
        options.delete(:id)
      end

      get(url, options)
    end

    def bill(os_id)
      url = "bills/#{os_id}/"
      get(url, {})
    end

    def legislators(options = {})
      url = "legislators/"
      url << "#{options[:leg_id]}/" if options[:leg_id]

      get(url, options)
    end

    def geo_legislators(lat, lon)
      url = "legislators/geo/"

      get(url, {:lat => lat, :long => lon})
    end

    def committees(options = {})
      url = "committees/"
      url << "#{options[:committee_id]}/" if options[:committee_id]

      get(url, options)
    end

    def events(options = {})
      url = "events/"
      url << "#{options[:event_id]}/" if options[:event_id]

      get(url, options)
    end

    def districts(options = {})
      return [] if !options[:state]

      url = "districts/"
      url << "#{options[:state]}/"
      url << "#{options[:chamber]}/" if options[:chamber]

      get(url, options)
    end

    def district_boundaries(boundary_id)
      return if !boundary_id

      url = "districts/boundary/#{boundary_id}/"

      get(url)
    end
  end
end
