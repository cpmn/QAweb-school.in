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

@NavigationTests @EmployeeTests
Scenario: Navigate through Employee Management menu option

When I select the sub category "Add Employee"
Then I should see the active option "Add Employee" in breadcrumb navigator
When I select the sub category "Add User Type"
Then I should see the active option "Add User Type" in breadcrumb navigator
When I select the sub category "Employee List"
Then I should see the active option "Employee List" in breadcrumb navigator

@UIValidationTests @EmployeeTests
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

@FuntionalTests @EmployeeTests
Scenario: Create an employee

When I select the sub category "Add Employee"
	And I fill the employee information fields
	|Employee Code   |testEmployee1  |
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
	|Email			 |atest@gmail.com|
	|Joining Date    |2015-5-06      |
	|Date of Birth   |1986-7-02		 |
When I click on save button in register form
Then I should see "0" validation error
Then I should see the active option "Employee List" in breadcrumb navigator
When I fill search box "testEmployee1"
Then I should see the employee displayed in table
	| Employee Code | testEmployee1    |  
	| Employee Name | vstestemp	       |
	| Department 	| IT department    |
	| Qualification | 5                |
	| Designation 	| IT Assistant 	   |
	| Email			| atest1@gmail.com |

@FuntionalTests @EmployeeTests
Scenario: Update an employee

When I select the sub category "Employee List"
	And I fill search box "testEmployee"
	When I click on edit eye icon for item "testEmployee1"
	And I fill the employee information fields
	|First Name 	 |updateTes	 |
	|Qualification	 |15		 |
	And I click on save button in employee details page
	And I fill search box "testEmployee1"
Then I should see the employee displayed in table
	| Employee Code | testEmployee1 |  
	| Employee Name | updateTes     |
	| Department 	| IT department |
	| Qualification | 15            |
	| Designation 	| IT Assistant 	   |
	| Email			| atest1@gmail.com |

@FuntionalTests @EmployeeTests
Scenario: Delete an employee

When I select the sub category "Employee List"
	And I fill search box "testEmployee1"
	And I click on remove item "testEmployee1"
	And I fill search box "testEmployee1"
Then I should see "No results found." message in the table