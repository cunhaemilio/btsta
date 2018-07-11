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


###

$env = ENV['BROWSER']
$headless = ENV['HEADLESS']

if $headless
    Capybara.register_driver :selenium do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
end
Capybara.configure do |c|

if $env == 'firefox'
    c.default_driver = :selenium
elsif $env == 'chrome'
    c.default_driver = :selenium_chrome
elsif $env == 'chrome_headless'
    c.default_driver = :selenium_chrome_headless

end

Capybara.default_max_wait_time = 20
    
end


