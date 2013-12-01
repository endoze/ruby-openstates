# Openstates

Ruby gem to interact with the Sunlight Labs OpenStates API.

## Installation

Add this line to your application's Gemfile:

    gem 'openstates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openstates

## Configuration

You will need to register for an API key with [Sunlight
Labs](http://services.sunlightlabs.com/api/register/).

If you intend to use this gem in a rails project, you should add the
following in `config/initializers/openstates.rb`

```rb
OpenStates.configure do |config|
  config.api_key ='yourkeyhere'
  config.logger = Rails.logger
end
```

If your project is not rails based, you just need to include the above
configuration somewhere in your ruby environment with single change.

```rb
OpenStates.configure do |config|
  config.api_key ='yourkeyhere'
  config.logger = ::Logger.new(STDOUT)
  config.logger.level = ::Logger::DEBUG
end
```

## Usage

### OpenStates::Bill

You can search for bills using the `where` class method on
OpenStates::Bill.

```rb
bills = OpenStates::Bill.where(state: 'tx', q: 'taxi')
```

You can also search for a specific bill by it's bill_id.

```rb
bill = OpenStates::Bill.find("12345")
```

And lastly, you can get bill details by using the `bill_details` class
method on OpenStates::Bill.

```rb
bill = OpenStates::Bill.bill_details('fl', '2013', '12345')
```

You can find a list of all query parameters for Bills
[here](http://sunlightlabs.github.io/openstates-api/bills.html).

### OpenStates::Committee

You can search for committees using the `where` class method on
OpenStates::Committee.

```rb
committees = OpenStates::Committee.where(state: 'ny')
```

You can also search for a specific committee by it's id.

```rb
committee = OpenStates::Committee.find("NYC000099")
```

You can find a list of all query parameters for Committees
[here](http://sunlightlabs.github.io/openstates-api/committees.html)

### OpenStates::District

You can search for districts using the `where` class method on
OpenStates::District.

```rb
districts = OpenStates::District.where(state: 'nj')
```

You can also search for a specific district by it's boundary_id.

```rb
district = OpenStates::District.find('12345')
```

You can find a list of all query parameters for Districts
[here](http://sunlightlabs.github.io/openstates-api/districts.html)

### OpenStates::Event

You can search for events using the `where` class method on
OpenStates::Event.

```rb
events = OpenStates::Event.where(state: 'ok')
```

You can also search for a specific event by it's event_id.

```rb
event = OpenStates::Event.find('1234567')
```

You can find a list of all query parameters for Events
[here](http://sunlightlabs.github.io/openstates-api/events.html)

### OpenStates::Legislator

You can search for legislators using the `where` class method on
OpenStates::Legislator.

```rb
legislators = OpenStates::Legislator.where(state: 'ga')
```

You can also search for a specific legislator by their leg_id.

```rb
legislator = OpenStates::Legislator.find('12345')
```

And lastly, you can search for legislators by geolocation details.

```rb
legislators = OpenStates::Legislator.by_location(45.13, -85.10)
```

You can find a list of all query parameters for Legislators
[here](http://sunlightlabs.github.io/openstates-api/legislators.html)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
