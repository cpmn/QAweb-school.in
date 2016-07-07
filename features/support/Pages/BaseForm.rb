#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def base_Form
	@base_Form ||=BaseForm.new
end

class BaseForm
	# include Capybara::DSL

	def initialize
		@label = 'label'
	end
	
	def set_text_box(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
		tex = label_found.text
		p "set text box #{tex}"
	  	label_found.find(:xpath, './following-sibling::input').set value
	end

	def set_date(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
		tex0 = label_found.text
		p "set date #{tex0}"
 		page.execute_script("$('input[class *= \"pickadate picker\"]').removeAttr('readonly')") #fine
 		label_found.find(:xpath, './following-sibling::div/input').set value		
	  	
	end

	def set_text_area(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
		tex2 = label_found.text
		p "set text area #{tex2}"

	  	label_found.find(:xpath, './following-sibling::textarea').set value
	end

	def select_option_in_dropdown(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
		tex3= label_found.text
		p "select option #{tex3}"
	  	label_found.find(:xpath, './following::select[1]').select value
	end

	def click_on_button(button_name)
		page.click_button button_name
	end
end
