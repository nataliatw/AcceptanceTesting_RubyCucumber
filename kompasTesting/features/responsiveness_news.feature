Feature: Website responsiveness

  Scenario: Test website responsiveness
    Given I am on the Kompas homepage
    When I resize the browser to mobile size
    Then the homepage should be displayed correctly on mobile
