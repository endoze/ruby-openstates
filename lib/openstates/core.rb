require 'faraday'
require 'faraday_middleware'
require 'faraday_stack'
require 'hashie/mash'
require 'openstates/version'
require 'openstates/mashify'
require 'openstates/connection'
require 'openstates/configuration'
require 'openstates/api'

module OpenStates
  extend OpenStates::Configuration
  extend OpenStates::Connection
  extend OpenStates::Api
end
