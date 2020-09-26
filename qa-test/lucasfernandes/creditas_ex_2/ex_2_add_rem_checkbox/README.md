# Exercise 2.1 - Adding and Removing Checkbox

Challenge to create a test automation to add and remove a checkbox from herokuapp page.

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
cucumber features/add_and_remove_checkbox.feature
```

## Explaining

* .feature: Scenario Outline to reuse scenarios
* Page Object: Gem siteprism to get page objects
* env.rb: Very clen, only selenium driver to open a chrome browser
* steps: reuse of removing checkbox steps to run adding checkbox scenario
