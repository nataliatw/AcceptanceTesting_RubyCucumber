Feature: Website performance

  Scenario: Test page load speed
    Given I am on the Kompas homepage
    When the page loads
    Then the page should load within 3 seconds
