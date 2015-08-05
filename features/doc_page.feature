Feature:
  As a user I want to see the doc page

Background:
  Given I am on "/"

Scenario: I click on Docs
Given I click on "doc-path"
Then I should be on "/api/docs"
