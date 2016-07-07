#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def add_employee_page
	@add_employee_page ||= AddEmployeePage.new
end

class AddEmployeePage
	# include Capybara::DSL

	def initialize
		@label = 'label'
	end
	
	def fill_field(field_label, value)
		if field_label == "Department" || field_label == "Designation" || field_label == "User Type" || field_label== "Gender" ||field_label=="Country" || field_label=="State"
			base_Form.select_option_in_dropdown(field_label, value)
		elsif field_label == "Present Address"
			base_Form.set_text_area(field_label, value)
		elsif field_label == "Joining Date" || field_label == "Date of Birth"
			base_Form.set_date(field_label, value)
		else
			base_Form.set_text_box(field_label, value)
		end
	end
	
	def click_on_save_button(button_name)
		base_Form.click_on_button(button_name)
	end
end