=begin
Author: Mario Perez
Description: - Create TopBar Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end

def topBarMenu
	@topBarMenu ||=TopBar.new
end

class TopBar
	include Capybara::DSL
	attr_reader :username

	def initialize
		@username = 'li.dropdown.dropdown-user a span'
		@arrow_down = '//i[@class="caret"]'
		@log_out= '//a[text() = "Log Out"]/i'
	end	
	def is_username_displayed_top_bar user_name
		page.has_css?(@username, :text => user_name)
	end

	def log_out()
		page.find(:xpath, @arrow_down).click
		page.find(:xpath, @log_out).click
	end

end