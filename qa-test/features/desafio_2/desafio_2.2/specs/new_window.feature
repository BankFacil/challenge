#language:en

@desafio2 @elemental_selenium @opening_window
Feature: Feature to validate a link that opens a new window on current browser

@opening_window_1
Scenario: Open window
    Given that i access the main screen page of the system with the link
    And has a link visible on screen
    When i click on the link to open a new window
    Then i switch to the new window
    And i validate the message on the body of page
    And i validate the current url