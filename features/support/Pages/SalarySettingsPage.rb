#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 10 Jul 2016
def salarySettingsPage
	@salarySettingsPage ||= SalarySettingsPage.new
end

class SalarySettingsPage
	include Capybara::DSL

	def initialize
	end
	
	def fill_field(field_label, value)
		if field_label == "Unit"
			baseForm.set_text_box(field_label, value)	
		else
			baseForm.select_option_in_dropdown(field_label, value)
		end
	end
end