require 'capybara'
require 'capybara/cucumber'
require 'report_builder'
require 'site_prism'
require 'selenium-webdriver'
require 'byebug'
require 'rspec'
require 'byebug'
require 'cpf_faker'
require "allure-cucumber"

AllureCucumber.configure do |config|
  config.results_directory = "reports"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end

unless ENV['URL']
  ENV['URL'] = 'https://inm-test-app.herokuapp.com'
end

docker_ip = %x(/sbin/ip route|awk '/default/ { print $3 }').strip
Capybara.register_driver :remote_chrome do |app|
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => :chrome,
                                 :url => "http://#{docker_ip}:4444/wd/hub")
end

Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: 'ignore-certificate-errors'
    }
  )
  Capybara::Selenium::Driver.new(app,:browser => :chrome,
                                 timeout: 30,
                                 desired_capabilities: capabilities)
end

Capybara.configure do |config|
  if ENV['ENV'] == 'DEV'
    config.default_driver = :remote_chrome
  else
    config.default_driver = :selenium
  end
  config.app_host = ENV['URL']
end