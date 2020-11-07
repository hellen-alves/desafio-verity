require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "pry"
require "selenium-webdriver"
require "rspec"
require "site_prism"
require "faker"
require "securerandom"

# criar constante com nome browsers

BROWSERS = ENV["BROWSERS"]

Capybara.register_driver :selenium do |app|
  case BROWSERS

  when "firefox_headless"
    option = ::Selenium::WebDriver::Firefox::Options.new(args: %w[--headless --disable-gpu --disable-infobars])
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: option, desired_capabilities: { accept_insecure_certs: true })
  when "chrome_headless"
    option = ::Selenium::WebDriver::Chrome::Options.new(args: %w[--headless --disable-gpu --log-level=3])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option, desired_capabilities: { accept_insecure_certs: true })
  when "firefox"
    option = ::Selenium::WebDriver::Firefox::Options.new(args: %w[--disable-gpu --disable-infobars])
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: option, desired_capabilities: { accept_insecure_certs: true })
  else
    option = ::Selenium::WebDriver::Chrome::Options.new(args: %w[--disable-gpu --disable-infobars --log-level=3])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option, desired_capabilities: { accept_insecure_certs: true })
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "https://www.verity.com.br/"
end

Capybara.default_max_wait_time = 20
Capybara.page.driver.browser.manage.window.maximize

Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == "Before hook"
    return text if text == "After hook"
    "#{source.last.keyword}#{text}"
  end
end
