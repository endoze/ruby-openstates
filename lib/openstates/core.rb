require 'faraday_middleware'
require 'hashie/mash'
require 'logger'
require 'openstates/version'
require 'openstates/mashed'
require 'openstates/mashify'
require 'openstates/connection'
require 'openstates/configuration'
require 'openstates/api'
require 'openstates/model'
require 'openstates/models/legislator'
require 'openstates/models/bill'
require 'openstates/models/committee'
require 'openstates/models/district'
require 'openstates/models/event'

module OpenStates
  extend OpenStates::Configuration
  extend OpenStates::Connection
  extend OpenStates::Api
end
