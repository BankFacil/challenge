require 'Httparty'
require 'pry'
require 'rspec'

Given(/^I post a "([^"]*)" and "([^"]*)" on JsonPlaceHolder$/) do |title, content|
  @url_json = 'http://jsonplaceholder.typicode.com/posts'
  @last_response = HTTParty.post("#@url_json",
    :body => { "data": {"title": "#{title}","body": "#{content}","userId": 1}}
  )
end

Then(/^I should be able to see my "([^"]*)" and my "([^"]*)" on JSonPlaceHolder$/) do |title, content|
  expect(@last_response.code).to eq 201
  expect(@last_response.parsed_response["data[title]"]).to eq title
  expect(@last_response.parsed_response["data[body]"]).to eq content
end
