#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016

def breadcrumb_navigator
	@breadcrumb_navigator ||=BreadcrumbNavigator.new
end

class BreadcrumbNavigator
	# include Capybara::DSL #always a nivel te clases

	def initialize
		@active_page = '.breadcrumb .active'
	end
	
	def get_ative_page_name()
		return page.find(@active_page).text
	end
end