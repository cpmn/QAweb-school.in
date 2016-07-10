=begin
Author: Paola Munoz - Mario Perez
Description: - Create Commons Steps Definitions			 
Version: 2.0
Date: 07 Jul 2016
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
  elsif user_type == 'Employee'
  	username, userpasswd = $employee_user, $employee_pass 
  elsif user_type == 'Guardian'
  	username, userpasswd = $guardian_user, $guardian_pass
  else
    username, userpasswd = 'WrongUser', 'WrongPassword'
  end

  logIn.set_user_name  username
  logIn.set_pasword  userpasswd
  logIn.click_sign_in_button  
end
When (/^I click on Sign In$/) do
  logIn.click_sign_in_button 
end


Then(/^I should see "([^"]*)"$/) do |text|
   expect(topBarMenu.is_username_displayed_top_bar(text)).to be(true)
end

When(/^I expand "(.*?)" option in side bar$/) do |menu_option|
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

When(/^I click on save button in register form$/) do
  addEmployeePage.click_on_save_button()
end

When(/^I click on first edit icon in table$/) do
  tableGrid.click_edit_icon()
end

When(/^I click on first delete icon in table$/) do
  tableGrid.click_remove_icon()
end

When(/^I fill search box "(.*?)"$/) do |search_text|
  tableGrid.set_search_box(search_text)
end

When(/^I logout in the application$/) do 
  topBarMenu.log_out()
end

Then(/^I should see "(.*?)" validation error$/) do |count| 
  expect(baseForm.validation_error_count(count)).to be(true)
end

Then(/^I should see the following error message$/) do |table_error_message| 
  error_message = table_error_message.raw
  error_message.each do |error|
    expect(baseForm.validation_error_txt(error[0])).to be(true) 
  end
end

When(/^I should see "(.*?)" message in the table$/) do |message|
  expect(tableGrid.is_no_result_message_displayed(message)).to be(true) 
end

Then(/^I should see the login page title "(.*?)"$/) do |message|
  expect(logIn.is_login_title_displayed(message)).to be(true) 
end