#Author: Paola Munoz	 
#Version: 1.0
#Date: 09 Jul 2016


class WaitAlertMsg
	include Capybara::DSL

	def initialize
		@alert = ''
	end
	def waitUntilAlertPresent_and_accept
		wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  		@alert = wait.until { page.driver.browser.switch_to.alert }
  		@alert.accept
	end
end