require "allure-cucumber"
require 'httparty'
require 'rspec'
require "json_matchers/rspec"
require 'dotenv'
require 'byebug'
require 'json'
require 'uri'

AllureCucumber.configure do |config|
  config.results_directory = "reports"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end

unless ENV['URL']
  ENV['URL'] = 'https://inm-test-api.herokuapp.com'
end
JsonMatchers.schema_root = "features/schemas"