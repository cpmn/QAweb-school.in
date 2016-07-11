#Author: Paola Munoz
#Description: - Login Validations
#Version: 1.0
#Date: 06 Jul 2016
#
#Updated at   | Update by
#06 Jul 2016  | Paola Munoz


Feature: Student Tasks
  
  @UIValidationTests @LoginTests @NavigationTests
  Scenario Outline: Login to WebShool Aplication with different users
    Given I am in web-school login page
    When I login as "<Role>"
    Then I should see "<UserName>"
    When I logout in the application
    Then I should see the login page title "Log In to Webschool"

    Examples:
    |Role         |UserName|
    |Administrator|admin   |
    |Student      |Ammu S RAJU|
    |Employee     |surya a raju|
    |Guardian     |ASSQ|

@UIValidationTests @LoginTests
Scenario: Log to the aplication with wrong user
    Given I am in web-school login page
    When I login as "Wrong User"
    And I should see the following error messages in login page 
      | Username is incorrect. |

@UIValidationTests @LoginTests
Scenario: Log to the applicatoin with empty credentials
    Given I am in web-school login page
    When I click on Sign In
    And I should see the following error messages in login page 
      | Username cannot be blank. |
      | Password cannot be blank. |

    