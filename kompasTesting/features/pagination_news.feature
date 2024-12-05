Feature: Pagination for long articles

  Scenario: Test article pagination
    Given I am reading a long article
    When I click the Show All button
    Then the full content of the article should be displayed without pagination