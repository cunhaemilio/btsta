require "capybara/cucumber"
require "rspec"
require "selenium-webdriver"


Capybara.register_driver :insecure_selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    desired_capabilities: { accept_insecure_certs: true }
  )
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :insecure_selenium
end

