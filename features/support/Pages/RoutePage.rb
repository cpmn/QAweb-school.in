=begin
Author: Mario Perez
Description: - Create Route Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end
def routePage
	@routePage ||= RoutePage.new
end

class RoutePage
	include Capybara::DSL

	def initialize
		@ward_name = 'span.media-heading.text-semibold'
		@vehicle_dropdown = '#Routemaster_transportvehicleid'
		@route_code_txt = 'Routemaster[routemaster_code]'
		@route_start_place_txt = 'Routemaster[routemaster_startname]'
		@route_stop_place_txt = 'Routemaster[routemaster_stopname]'
	end

	def click_ward_name(ward_name)
	    find(@ward_name, :text => ward_name).click
	end

	def fill_field(field_label, value)
		if field_label == "Vehicle No" 
			baseForm.select_option_in_dropdown(field_label, value)
		else
			baseForm.set_text_box(field_label, value)
		end
	end

	def wait_for_route_elements()
		page.has_css?(@vehicle_dropdown)
	 	page.has_css?(@route_code_txt)
	 	page.has_css?(@route_stop_place_txt)
	 	page.has_css?(@route_start_place_txt)
        page.driver.browser.navigate.refresh
	end

	def validation_route_value(value)
		match = tableGrid.is_value_displayed_in_first_row(value)
	end
		
end


