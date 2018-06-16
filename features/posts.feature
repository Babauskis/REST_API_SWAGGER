Feature: Posts feature
  Test the functionality of blog posts

  Scenario: Post blog - positive
    Given I have logged in as a regular user
    Then I can access my profile information
    Then I can create a new blog post
    And I check if blog post was created

  Scenario: Blog title - update
    Given I have logged in as a regular user
    Then I can access my profile information
    Then I can create a new blog post
    And I check if blog post was created
    Then I update blog title