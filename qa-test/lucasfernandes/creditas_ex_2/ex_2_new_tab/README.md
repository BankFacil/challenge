# Exercise 2.2 - Validating a New Tab

Challenge to validate if a new tab was opened in herokuapp website.

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
cucumber features/new_tab.feature
```

## Explaining

* .feature: Scenario Outline to get the message from new tab
* Page Object: Very simple, only url and a link, using siteprism
* env.rb: Very clean, only selenium driver to open a chrome browser
* steps: the main point here was the method window_opened_by to manage a new tab
