require "capybara/cucumber"
require "rspec"
require "selenium-webdriver"



Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://automacaocombatista.herokuapp.com/'
    config.default_max_wait_time = 15
end