#Author: Mario Perez
#Description: - Route feature			 
#Version: 1.0
#Date: 07 Jul 2016

Feature: Route

Background: Open web-school page and login as Guardian
	Given I am in web-school login page
    When I login as "Guardian"
    Then I should see "ASSQ"
	
  @UIValidationTest @route
  Scenario: UI validation with guardian user.
	
	When I select ward name "Ammu S RAJU"
	  And I expand "Transport" option in side bar
	  And I select the sub category "Add Route"
	Then I should see the active option "Add Route" in breadcrumb navigator

	When I click on save button in register form
	Then I should see "4" validation error
	  And I should see the following error message 
	  | Vehicle No. cannot be blank.       |
	  | Route Code cannot be blank.        |
	  | Route Start Place cannot be blank. |
	  | Route Stop Place cannot be blank.  |
	
	When I fill the route information fields
	| Vehicle No        | 3636             |

	  And I click on save button in register form
	Then I should see "3" validation error
	  And I should see the following error message 
	  | Route Code cannot be blank.        |
	  | Route Start Place cannot be blank. |
	  | Route Stop Place cannot be blank.  |
	
	When I fill the route information fields
	| Route Code	    | MPZ001	       |
	  And I click on save button in register form
	Then I should see "2" validation error
	  And I should see the following error message 
	  | Route Start Place cannot be blank. |
	  | Route Stop Place cannot be blank.  |
	
	When I fill the route information fields
	| Route Start Place	| Av America	   |
	  And I click on save button in register form
	Then I should see "1" validation error
	  And I should see the following error message 
	  | Route Stop Place cannot be blank.  |

  @FunctionalTest @route
  Scenario: Functional Test with guardian user.
	
	When I select ward name "Ammu S RAJU"
	  And I expand "Transport" option in side bar
	  And I select the sub category "Add Route"
	Then I should see the active option "Add Route" in breadcrumb navigator
	
	When I fill the route information fields
	| Vehicle No        | 3636             |
	| Route Code	    | MPZ001	       |
	| Route Start Place	| Av America	   |
	| Route Stop Place  | Av Melchor Perez |
	  And I click on save button in register form
	  And I wait for Route page is refreshed
	  And I fill search box "MPZ001"

	Then I should see the new route displayed
	| Vehicle No        | 3636             |  
	| Code              | MPZ001           |
	| Route Start Place | Av America       |
	| Route Stop Place  | Av Melchor Perez |
	
	When I click on first edit icon in table
      And I fill the route information fields
	  | Vehicle No        | 1001             |
	  | Route Code	      | MPZ202	         |
	  | Route Start Place | Av Santa Cruz    |
	  | Route Stop Place  | Av Simon Lopez   |
      And I click on save button in register form
      And I wait for Route page is refreshed
	  And I fill search box "MPZ202"

	Then I should see the new route displayed
	| Vehicle No        | 1001             |  
	| Code              | MPZ202           |
	| Route Start Place | Av Santa Cruz    |
	| Route Stop Place  | Av Simon Lopez   |  
	
	When I logout in the application
	  When I login as "Administrator"
    Then I should see "admin"

    When I expand "Transport" option in side bar
	  And I select the sub category "Add Route"
	Then I should see the active option "Add Route" in breadcrumb navigator

	When I fill search box "MPZ202"
      And I click on first delete icon in table
    Then I should see "No results found." message in the table
