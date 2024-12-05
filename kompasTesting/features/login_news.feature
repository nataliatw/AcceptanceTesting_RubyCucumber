Feature: Login functionality on Kompas.com

  Scenario: Successful login
    Given I am on the Kompas login page
    When I log in with valid credentials
    Then I should be redirected to the Kompas homepage

  Scenario: Login with empty email
    Given I am on the Kompas login page
    When I log in with an empty "email"
    Then I should see an error message for empty "email"

  Scenario: Login with empty password
    Given I am on the Kompas login page
    When I log in with an empty "password"
    Then I should see an error message for empty "password"

  Scenario: Login with invalid credentials
    Given I am on the Kompas login page
    When I log in with invalid credentials
    Then I should see an error message for invalid credentials

  Scenario: Protect against SQL Injection
    Given I am on the Kompas login page
    When I attempt to log in with SQL Injection payload

  Scenario: Protect against brute force attacks
    Given I am on the Kompas login page
    When I attempt multiple invalid logins
