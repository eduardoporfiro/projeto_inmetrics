require "allure-cucumber"
require 'httparty'
require 'rspec'
require "json_matchers/rspec"
require 'dotenv'
require 'byebug'
require 'json'
require 'uri'

unless ENV['URL']
  ENV['URL'] = 'https://inm-test-api.herokuapp.com'
end
JsonMatchers.schema_root = "features/schemas"