#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 10 Jul 2016

Feature: Payroll

Background: Open web-school page and login as Admin
Given I am in web-school login page
When I login as "Administrator"
Then I should see "admin"
When I expand "HR/Payroll" option in side bar
	And I expand "Payroll" option in side bar

@NavigationTests @PayrollTests
Scenario: Navigate through Payroll menu option

When I select the sub category "Pay Head"
Then I should see the active option "Pay Head Type" in breadcrumb navigator
When I select the sub category "Payment Types"
Then I should see the active option "Payable Type" in breadcrumb navigator
When I select the sub category "Salary Settings"
Then I should see the active option "Salary Settings" in breadcrumb navigator