#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def table
	@table ||=Table.new
end

class Table
	# include Capybara::DSL

	def initialize
		@search_box = '#search'
		@edit_icon = '.glyphicon.glyphicon-pencil'
		@remove_icon = '.glyphicon.glyphicon-remove'
	end
	
	def set_search_box(value)
		p "set: #{value}"
		page.find(@search_box).set value
	end

	def click_edit_icon()
		page.find(@edit_icon).click
	end

	def click_remove_icon()
		page.find(@remove_icon).click
	end
end