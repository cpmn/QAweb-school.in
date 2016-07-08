=begin
Author: Paola Munoz
Description: - Create TopBar Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end

Given(/^I am in web\-school login page$/) do
  visit ('/')
  page.driver.browser.manage.window.maximize
end

When(/^I login as "([^"]*)"$/) do |user_type|
  if user_type == 'Administrator'
  	username, userpasswd = $admin_user, $admin_pass 
  elsif user_type == 'Student'
  	username, userpasswd = $student_user, $student_pass 
  elsif user_type == 'Empoyee'
  	username, userpasswd = $employee_user, $employee_pass 
  else user_type == 'Guardian'
  	username, userpasswd = $guardian_user, $guardian_pass 
  end

  logIn.set_user_name  username
  logIn.set_pasword  userpasswd
  logIn.click_sign_in_button  
end

Then(/^I should see "([^"]*)"$/) do |text|
   expect(topBarMenu.is_username_displayed_top_bar(text)).to be(true)
end

When(/^I expand "(.*?)" option in side bar$/) do |menu_option|
  p menu_option
  sideBarMenu.expand_category(menu_option)
end

When (/^I select the sub category "(.*?)"$/) do |sub_option|
  sideBarMenu.expand_sub_category(sub_option) 
end

Then (/^I should see the title "(.*?)"$/) do |title| 
  expect(sideBarMenu.is_title_displayed(title)).to be(true) 
end

Then(/^I should see the active option "([^"]*)" in breadcrumb navigator$/) do |active_option|
  expect(breadcrumbNavigator.get_ative_page_name()).to eq(active_option)
end

When(/^Click on save button in register form$/) do
  addEmployeePage.click_on_save_button()
end

# When(/^I fill search box "(.*?)"$/) do |search_text|
#   table.set_search_box(search_text)
# end

When(/^I fill search box (.*?)$/) do |search_text|
p search_text
  table.set_search_box(search_text)
end
