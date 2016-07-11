#Author: Paola Munoz
#Description: - Create Scenarios Student subcategory option
#Version: 1.0
#Date: 06 Jul 2016
#
#Updated at   | Update by
#07 Jul 2016  | Paola Munoz


Feature: Student

Background: Open web-school page and login as Student
  Given I am in web-school login page
  When I login as "Student"
  Then I should see "Ammu S RAJU"
  
  @StudentTests @FuntionalTests
  Scenario: Create, Modify and Delete a Student Category
    When I expand "Student" option in side bar
      And I select the sub category "Student Category"
    Then I should see the active option "Student Category" in breadcrumb navigator    
    
    When I fill Student Category field 
     |Student Category|SpecialNeeds|    
     And I click on save button in register form
    When I select the sub category "Student Category"
    Then I should see the active option "Student Category" in breadcrumb navigator
      And I should see "SpecialNeeds" in Student Category table
    
    When I click on update item "SpecialNeeds"
      And I fill Student Category field    
       |Student Category|SpecialNeedsChildren|    
      And I click on save button in register form
      And I select the sub category "Student Category"
    Then I should see the active option "Student Category" in breadcrumb navigator
      And I should see "SpecialNeedsChildren" in Student Category table
    When I logout in the application
      And I login as "Administrator"
      And I expand "Student" option in side bar
      And I select the sub category "Student Category"      
      And I click on remove item "SpecialNeedsChildren"
    Then I should not see "SpecialNeedsChildren" in Student Category list



