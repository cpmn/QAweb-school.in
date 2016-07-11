#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
When(/^I fill the employee information fields$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, value|
  	employeePage.fill_field(label, value)
  end
end

Then(/^I should see the employee displayed in table$/) do |table|
	values = table.rows_hash
    values.each_pair do |label, value|
      expect(tableGrid.is_value_displayed_in_first_row(value)).to be(true)
    end
end

When(/^I click on edit eye icon for item "([^"]*)"$/) do |item|
	tableGrid.click_eye_edit_icon_by_value(item)
end

When(/^I click on save button in employee details page$/) do
	employeePage.click_on_save_arrow_right_button()
end
