# encoding: utf-8

Feature: Add and remove a checkbox from herokuapp
  As a great automated tester
  I would like to remove a checkbox from a herokuapp page
  Then validate whether it was removed
  And I would like to add the same checkbox again
  Then validate whether it was added in the page

  Scenario Outline: Remove a checkbox from herokuapp
    Given I am on herokuapp dynamic controls page
    And I select the checkbox and remove it
    Then I should be able to see a <message>

    Examples:
    |   message    |
    | "It's gone!" |


  Scenario Outline: Add a checkbox in herokuapp
    Given I am on herokuapp dynamic controls page
    And I click on Add button
    Then I should be able to see a <message>
    And I see a checkbox on the screen

    Examples:
    |   message    |
    | "It's back!" |
