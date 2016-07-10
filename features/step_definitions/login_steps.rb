#Author: Paola Munoz	 
#Version: 1.0
#Date: 07 Jul 2016

Then(/^I should see the following error messages in login page$/) do |table_error_message|
	list_of_error=table_error_message.raw	
	list_of_error.each do |error| 		
		expect(logIn.validation_error_txt(error[0])).to be(true)
	end
	
end


