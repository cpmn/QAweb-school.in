#Author: Paola Munoz	 
#Version: 1.0
#Date: 09 Jul 2016


class WaitAlertMsg
	def initialize
		@alert = ''
	end
	def waitUntilAlertPresent
		wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  		@alert = wait.until { page.driver.browser.switch_to.alert }
	end
	def accept_the_alert_message
		@alert.accept
	end
	def cancel_the_alert_message
		@alert.dismuss
	end
end