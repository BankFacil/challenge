#language:en

@desafio2 @elemental_selenium @dynamic_controls
Feature: Feature to add and remove a checkbox on the screen

Background: Access to the main screen page
    Given that i access the main screen page of the system
    And has a checkbox visible on screen

@dynamic_controls_1
Scenario: Add a checkbox
    When i click on Remove button
    Then the checkbox is removed
    And a message is showed on the place of the checkbox

@dynamic_controls_2
Scenario: Remover um checkbox
    When i click on Remove button
    And the checkbox is removed
    And a message is showed on the place of the checkbox
    And i click on Add button
    Then another message is showed
    And a checkbox it is added to the screen
    And i can check it to TRUE
    And i can check it to FALSE