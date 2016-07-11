#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 10 Jul 2016

When(/^I fill the salary settings information fields$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, value|
  	salarySettingsPage.fill_field(label, value)
  end
end