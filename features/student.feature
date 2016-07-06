#Author: Paola Munoz
#Description: - Create TopBar Page Object			 
#Version: 1.0
#Date: 06 Jul 2016


Feature: Login


Background: Open web-school page and login as Student
	Given I am in web-school login page
    When I login as "Student"
    Then I should see "Ammu S RAJU"


@ClickTest
Scenario: navigate through student menu option

When I expand "Student" option in side bar
	And I select the sub category "Student Category"
Then I should see the title "Student Category"

@UIValidation

@FuntionalTest



