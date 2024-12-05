Feature: Search news on Kompas.com

  Scenario: Search for a specific news and read the article
    Given I am on the Kompas homepage
    When I search for "Pilkada 2024"
    Then I should be redirected to the search results page
    And I should see search results related to "Pilkada 2024"
    When I click on the first news article
    Then I should be redirected to the article page
    And I should see the content of the article
  
  Scenario: Search news with a typo
    Given I am on the Kompas homepage
    When I search for "Pilkkada 2024"
    Then I should see suggestions related to "Pilkada 2024"
