require 'faraday_middleware'
require 'hashie/mash'
require 'logger'
require 'openstates/version'
require 'openstates/mashify'
require 'openstates/connection'
require 'openstates/configuration'
require 'openstates/api'
require 'openstates/model'
require 'openstates/models/legislator'
require 'openstates/models/bill'

module OpenStates
  extend OpenStates::Configuration
  extend OpenStates::Connection
  extend OpenStates::Api
end
