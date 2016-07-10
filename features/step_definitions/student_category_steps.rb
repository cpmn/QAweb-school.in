#Author: Paola Munoz	 
#Version: 1.0
#Date: 07 Jul 2016

When(/^I fill Student Category field$/) do |table|
  values = table.rows_hash
  values.each_pair do |label, value|    
    baseForm.set_text_box(label, value)
  end
end

When(/^I type "(.*?)" in "(.*?)" field$/) do |value, label|
	baseForm.set_text_box(label, value)
end

Then(/^I should see "(.*?)" in Student Category table$/) do |value|
	expect(tableGrid.is_value_displayed_in_first_row(value)).to be(true) 
end

When(/^I click on update item "(.*?)"$/) do |value|
	tableGrid.click_edit_icon_by_value(value)
end

When(/^I click on remove item "(.*?)"$/) do |value|
	tableGrid.click_remove_icon_by_value(value)
end

Then(/^I should not see "(.*?)" in Student Category list$/) do |value|
	expect(tableGrid.is_value_displayed_in_first_row(value)).to be(false) 
end


