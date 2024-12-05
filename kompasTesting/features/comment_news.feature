Feature: Comment on articles on Kompas.com

  Scenario: Post a comment on an article
    Given I am logged in
    And I am on an article page
    When I click on the comment icon
    Then I should be redirected to the comment page
    When I write a comment "Komentar biasa"
    And I click the send button
    Then my comment should be displayed on the article

  Scenario: Post a comment with special characters
    Given I am logged in
    And I am on an article page
    When I click on the comment icon
    Then I should be redirected to the comment page
    When I write a comment with special characters "Komentar dengan emoji 😃 dan simbol ©"
    And I click the send button
    Then my comment with special characters should be displayed on the article

