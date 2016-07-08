#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016

Feature: Employee

Background: Open web-school page and login as Admin
Given I am in web-school login page
When I login as "Administrator"
Then I should see "admin"

@NavigationTests @EmployeeTest
Scenario: Navigate through Employee Management menu option

When I expand "HR/Payroll" option in side bar
	And I expand "Employee Management" option in side bar
	And I select the sub category "Add Employee"
Then I should see the active option "Add Employee" in breadcrumb navigator
When I select the sub category "Add User Type"
Then I should see the active option "Add User Type" in breadcrumb navigator
When I select the sub category "Employee List"
Then I should see the active option "Employee List" in breadcrumb navigator

@FuntionalTests @EmployeeTest2
Scenario: Create a employee

Given I expand "HR/Payroll" option in side bar
	And I expand "Employee Management" option in side bar
	And I select the sub category "Add Employee"
When I fill the employee information fields
	|Employee Code   |A1111          |
	|Department		 |IT department	 |
	|Designation	 |IT Assistant	 |
	|Qualification	 |5				 |
	|Total Experience|10 			 |
	|User Type       |Teaching staff |
	|First Name 	 |vstestemp		 |
	|Gender			 |Female  		 |
	|Present Address |Quillacollo    |
	|City			 |City 			 |
	|Pin			 |01 			 |
	|Country		 |Bolivia		 |
	|State			 |Beni			 |
	|Mobile 		 |11111 		 |
	|Email			 |test1@gmail.com|
When Click on save button in register form

@FuntionalTests @EmployeeTest
Scenario: Create a employee

Given I expand "HR/Payroll" option in side bar
	And I expand "Employee Management" option in side bar
	And I select the sub category "Add Employee"
When Click on "Save" button in register form

@FuntionalTests @EmployeeTest3
Scenario: Create a employeeddd

Given I expand "Transport" option in side bar
	And I select the sub category "Add Route"
When I fill search box dyt
