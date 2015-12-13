Given(/^I m on the nobalk's sign in page$/) do
  visit'https://nobalk-imlbf.c9.io/login'
end

Then(/^I press the button Entrar com Google$/) do
  page.find(:id, 'sign_in').click
end

Then(/^I should see my homepage at the site$/) do
  assert_current_path('/admin')
end

 