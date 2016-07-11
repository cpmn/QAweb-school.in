#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def employeePage
	@employeePage ||= EmployeePage.new
end

class EmployeePage
	include Capybara::DSL

	def initialize
		@label = 'label'
		@save_arrow_right_button = '.btn.btn-primary'
	end
	
	def fill_field(field_label, value)
		if field_label == "Department" || field_label == "Designation" || field_label == "User Type" || field_label== "Gender" ||field_label=="Country" || field_label=="State"
			baseForm.select_option_in_dropdown(field_label, value)
		elsif field_label == "Present Address"
			baseForm.set_text_area(field_label, value)
		elsif field_label == "Joining Date" || field_label == "Date of Birth"
			baseForm.set_date(field_label, value)
		else
			baseForm.set_text_box(field_label, value)
		end
	end

	def click_on_save_arrow_right_button()
		button = page.find(@save_arrow_right_button)
        baseForm.scrolldown_by_element(button)
        button.click
        page.find('.pace-done')
	end
end