require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'report_builder'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['HEADLESS']
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--disable-gpu')

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.default_max_wait_time = 30
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'cucumber.json'
    config.report_path = 'cucumber_report'
    config.report_title = 'Cucumber Test Results'
    config.color = 'blue'
  end
  ReportBuilder.build_report
end