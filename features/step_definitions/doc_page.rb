Given(/^I am on "(.*?)"$/) do |page|
  visit(page)
end

Given(/^I click on "(.*?)"$/) do |link|
  find_link(link).click
end

Then(/^I should be on "(.*?)"$/) do |page|
  assert_equal current_path, page
end
