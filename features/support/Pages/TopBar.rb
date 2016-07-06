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
	end	
	def is_username_displayed_top_bar user_name
		page.has_css?(@username, :text => user_name)
	end

end