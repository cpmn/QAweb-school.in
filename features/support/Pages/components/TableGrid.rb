#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def tableGrid
	@tableGrid ||=TableGrid.new
end

class TableGrid
	include Capybara::DSL

	def initialize
		@search_box = '#search'
		@edit_icon = '.glyphicon.glyphicon-pencil'
		@remove_icon = '.glyphicon.glyphicon-remove'
		@table_cell = '#item-grid table.items td'
		@no_resutls = '#item-grid table.items span.empty'
	end
	
	def set_search_box(value)
		page.find(@search_box).set value
	end

	def click_edit_icon()
		page.find(@edit_icon).click
	end

	def click_remove_icon()
		page.find(@remove_icon).click
		page.driver.browser.switch_to.alert.accept
	end

	def is_no_result_message_displayed(message)
        page.has_css?(@no_resutls, :text => message)
	end

	def is_value_displayed_in_first_row(value)
		page.has_css?(@table_cell, :text => value, :match => :prefer_exact)
	end

end