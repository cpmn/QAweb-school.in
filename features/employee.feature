#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 06 Jul 2016

Feature: Employee

Background: Open web-school page and login as Admin
Given I am in web-school login page
When I login as "Administrator"
Then I should see "admin"
When I expand "HR/Payroll" option in side bar
	And I expand "Employee Management" option in side bar

@NavigationTests @EmployeeTest
Scenario: Navigate through Employee Management menu option

When I select the sub category "Add Employee"
Then I should see the active option "Add Employee" in breadcrumb navigator
When I select the sub category "Add User Type"
Then I should see the active option "Add User Type" in breadcrumb navigator
When I select the sub category "Employee List"
Then I should see the active option "Employee List" in breadcrumb navigator

@UIValidationTest @EmployeeTest
Scenario: UI validation for Add Employee page.
	
When I select the sub category "Add Employee"
	And I click on save button in register form
Then I should see "14" validation error
	And I should see the following error message 
	| Joining Date cannot be blank.    	|
	| Department cannot be blank. 	   	|
	| Designation cannot be blank. 	   	|
	| Qualification cannot be blank.	|	
	| Total Experience cannot be blank.	|
	| First Name cannot be blank.		|
	| Present Address cannot be blank.	|
	| Date of Birth cannot be blank.	|
	| Gender cannot be blank.			|
	| City cannot be blank.				|
	| Pincode cannot be blank.			|
	| State cannot be blank.			|
	| Mobile cannot be blank.			|
	| Email cannot be blank.			|

@FuntionalTests @EmployeeTest
Scenario: Create a employee

When I select the sub category "Add Employee"
	And I fill the employee information fields
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