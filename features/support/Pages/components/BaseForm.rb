#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
def baseForm
	@baseForm ||=BaseForm.new
end

class BaseForm
	include Capybara::DSL

	def initialize
		@label = 'label'
		@input_box = './following-sibling::input'
		@text_area = './following-sibling::textarea'
		@input_date = './following-sibling::div/input'
		@dropdown = './following::select[1]'
		@save_button = '#std_reg_submit'
		@validation_error = 'div.school_val_error'
	end
	
	def set_text_box(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
	  	label_found.find(:xpath, @input_box).set value
	end

	def set_date(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
 		page.execute_script("$('input[class *= \"pickadate picker\"]').removeAttr('readonly')")
 		label_found.find(:xpath, @input_date).set value		
	  	
	end

	def set_text_area(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
	  	label_found.find(:xpath, @text_area).set value
	end

	def select_option_in_dropdown(field_label, value)
		label_found = page.find(@label,:text => field_label, :match => :prefer_exact)
	  	label_found.find(:xpath, @dropdown).select value
	end

	def click_on_save_button()
		page.find(@save_button).click
	end

	def validation_error_count(count) 
	    page.has_css?(@validation_error, :count => count.to_i)
	end

	def validation_error_txt(error_message) 
	    page.has_css?(@validation_error, :text => error_message)
	end

end
