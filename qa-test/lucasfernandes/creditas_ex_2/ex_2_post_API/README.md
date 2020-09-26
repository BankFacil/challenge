# Exercise 2.3 - Create a Post Through a Public API

Challenge to create a post and validate it through JSONPlaceHolder API

## Getting Things Ready

### Prerequisites

A few technologies are required before executing the tests:

```
Ruby

bundler (gem install bundler)
```

### ENV

Just run the gem bundler and be happy

```
bundle install
```

### Running the test

It's that easy:

```
cucumber features/create_post.feature
```

## Explaining

* .feature: Scenario Outline to create different posts with different messages and titles
* steps: Gem HTTParty to create and validate HTTP requests
