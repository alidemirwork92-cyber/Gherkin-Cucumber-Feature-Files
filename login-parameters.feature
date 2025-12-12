Feature: Login Prod Feature
    As a user I want to log in to my account so that I can access my dashboard
    
  Background: 
      Given I navigate to the facebook page
      When I validate the page title

  Scenario Outline: Successful login on Production with valid credentials
    Then I enter the username as "<username>"
    And I enter the password as "<password>"
    And I select the country and city
    |country| city      |  
    |India  | Bangalore |
    | USA   | New York  |
    | UK    | London    |
    
    And I click the login button
    
    Examples:
      | username       | password          |
      | testproduser   | testprodpassword  |
      | testproduser1  | testprodpassword1 |
      | testproduser2  | testprodpassword2 |
      | testproduser3  | testprodpassword3 |
      | testproduser4  | testprodpasswor4  |