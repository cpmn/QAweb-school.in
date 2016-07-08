#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016
When(/^I fill the employee information fields$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, value|
  	addEmployeePage.fill_field(label, value)
  end
end