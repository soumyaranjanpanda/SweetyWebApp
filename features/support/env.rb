$LOAD_PATH.unshift(File.dirname(__FILE__)+ '/../..')
require 'selenium-webdriver'
require 'features/support/page'
require 'config/base_config'

load "config/propFile.rb"
puts br = (ENV['BROWSER_TYPE']).to_sym

driver = Selenium::WebDriver.for :"#{br}"

config = EnvConfig.new

Before do
  @driver = driver
  Page.driver=driver
  @config = config
  Page.config = config
end


After do |scenario|
    screenshot = "#{scenario.name}.png"
    @driver.save_screenshot('report/screenshots/'+screenshot)
    embed screenshot, 'image/png'
end

at_exit do
  driver.quit
end
