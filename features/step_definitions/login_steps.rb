  Given(/^I am in the nobalk's sign in page$/) do
  visit'https://nobalk-imlbf.c9.io/login'
  end
  
  Then(/^I  fill the email camp$/) do
    fill_in 'username', :with => 'qwerty@qwerqwerty.com'  
    end
  Then(/^I  fill the senha camp$/) do
    fill_in 'password', :with => 'qwerty'  
  end
  When(/^I press entrar$/) do
  page.find(:id, 'login-submit').click
  end
Then(/^I should see my homepage on the site$/) do
      visit'https://nobalk-imlbf.c9.io/home'
      #assert_current_path('https://nobalk-imlbf.c9.io/pedidos')
end

 