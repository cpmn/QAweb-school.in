#Author: Virginia Sanabria		 
#Version: 1.0
#Date: 10 Jul 2016

Feature: Salary settings

Background: Open web-school page and login as Admin
Given I am in web-school login page
When I login as "Administrator"
Then I should see "admin"

@UIValidationTest @SalaryTest
Scenario: UI validation for Salary Settings page.
	
When I expand "HR/Payroll" option in side bar
	And I expand "Payroll" option in side bar
	And I select the sub category "Salary Settings"
	And I click on save button in register form
Then I should see "4" validation error
	And I should see the following error message 
	| Designation cannot be blank.    |
	| Employee Name cannot be blank.  |
	| Payhead Master cannot be blank. |
	| Unit cannot be blank.	          |
When I fill the salary settings information fields
	|Designation   |Admin Assistant |
	And I click on save button in register form
Then I should see "3" validation error
	And I should see the following error message 
	| Employee Name cannot be blank.  |
	| Payhead Master cannot be blank. |
	| Unit cannot be blank.	          |	
When I fill the salary settings information fields
	|Unit   |unit |
	And I click on save button in register form
Then I should see the following error message 
	| Unit should contain only numbers.|

@FuntionalTests @SalaryTest1
Scenario: Create, update and delete a salary settings

When I expand "HR/Payroll" option in side bar
	And I expand "Employee Management" option in side bar
	And I select the sub category "Add Employee"
	And I fill the employee information fields
	|Employee Code   |adminTest 	 |
	|Department		 |IT department	 |
	|Designation	 |Admin Assistant|
	|Qualification	 |5				 |
	|Total Experience|10 			 |
	|User Type       |Teaching staff |
	|First Name 	 |adminTestt	 |
	|Gender			 |Female  		 |
	|Present Address |Quillacollo    |
	|City			 |City 			 |
	|Pin			 |01 			 |
	|Country		 |Bolivia		 |
	|State			 |Beni			 |
	|Mobile 		 |11111 		 |
	|Email			 |adminTest@gmail.com|
	|Joining Date    |2015-5-06      |
	|Date of Birth   |1986-7-02		 |
When I click on save button in register form
Then I should see "0" validation error
When I expand "Payroll" option in side bar
	And I select the sub category "Salary Settings"
	And I fill the salary settings information fields
	|Designation   |Admin Assistant |
	|Payhead Master|basic           |
	|Unit   	   |111 			|
	|Employee Name |adminTestt		|
	And I click on save button in register form
Then I should see "0" validation error
When I fill search box "adminTestt"
Then I should see the employee displayed in table
	| Employee Name | adminTestt     |

@FuntionalTests @SalaryTest2
Scenario: Create and delete a salary settings
When I expand "HR/Payroll" option in side bar
	And I expand "Payroll" option in side bar
	And I select the sub category "Salary Settings"
Then I should see "0" validation error
When I fill search box "adminTestt"
Then I should see the employee displayed in table
	| Employee Name | adminTestt     |	
When I click on remove item "adminTestt"
	And I fill search box "adminTestt"
Then I should see "No results found." message in the table
