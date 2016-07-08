# coding: utf-8
=begin
Author: Mario Perez
Description: - Route Steps Definition			 
Version: 1.0
Date: 06 Jul 2016
=end

###### WHEN #############

When (/^I select ward name "(.*?)"$/) do |ward_name| 
  routePage.click_ward_name(ward_name)
end

When(/^I fill the route information fields$/) do |table|
  values = table.rows_hash
   values.each_pair do |label, value|
    routePage.fill_field(label, value)
  end
end

When (/^I wait for Route page is refreshed$/) do  
  routePage.wait_for_route_elements()
end

Then(/^I should see the new route displayed$/) do |table|
  values = table.rows_hash
    values.each_pair do |label, value|
      expect(routePage.validation_route_value(value)).to be(true)
    end
end

