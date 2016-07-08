#Author: Mario Perez
#Description: - Guardian Navigation feature			 
#Version: 1.0
#Date: 07 Jul 2016

Feature: Navigation
  @NavigationTest
  Scenario: Navigation testing with admin user.

    Given I am in web-school login page
    When I login as "Guardian"
    Then I should see "ASSQ"

	When I select ward name "Ammu S RAJU"
	  And I expand "Settings" option in side bar
	  And I select the sub category "Add Institution Details"
    Then I should see the active option "Institution Details" in breadcrumb navigator

	When I select the sub category "Academic Details"
	Then I should see the active option "Academic Details" in breadcrumb navigator
	
	When I select the sub category "Student Import"
	Then I should see the active option "Student Import" in breadcrumb navigator
	
	When I select the sub category "Employee Import"
	Then I should see the active option "Employee Import" in breadcrumb navigator
	
	When I select the sub category "Privileges"
	Then I should see the active option "Privileges" in breadcrumb navigator
	
	When I select the sub category "Assign Courses"
	Then I should see the active option "Assign Course" in breadcrumb navigator
	
	When I select the sub category "Users"
	Then I should see the active option "Users" in breadcrumb navigator
	
	
	