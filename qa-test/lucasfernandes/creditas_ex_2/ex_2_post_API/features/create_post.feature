# encoding: utf-8

Feature: Create a post on JsonPlaceHolder public API
  As a great automated tester 
  I would like to create a new post on JsonPlaceHolder website
  Then validate whether my comment was posted

  Scenario Outline: Create a post on JsonPlaceHolder
    Given I post a <title> and <content> on JsonPlaceHolder
    Then I should be able to see my <title> and my <content> on JSonPlaceHolder

    Examples:
    |                   title                     |           content           |
    | "Am I ready for Creditas?"                  | "I hope so"                 |
    | "What am I supposed to do to get this job?" | "Get these tests ready o/"  |
    | "The lowest market interest?!"              | "Yuuuuupy!!"                |
