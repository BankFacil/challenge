#language:en

@desafio2 @json_place_holder @/posts
Feature: jsonplaceholder API

@post_scenarios_1
Scenario: POST some data
    Given that i have the URI of jsonplaceholder API to consume a resource
    When i define the params of structure
    And make a send with verb post
    Then i receive a valid response body with attributes sended on API structure
    And a valid status code equal to 201