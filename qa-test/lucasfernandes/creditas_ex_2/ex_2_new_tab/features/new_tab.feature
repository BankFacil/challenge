# encoding: utf-8

Feature: Validate whether a new tab was opened by clicking on a link
  As a great automated tester
  I would like to validate if a new tab was opened after a click

  Scenario Outline: Open a new tab
    Given I am on herokuapp windows page
    And I click on a link
    Then I should be able to see a <message> on a new tab

    Examples:
    |    message   |
    | "New Window" |
