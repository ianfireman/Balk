Given(/^I am logged on Nobalk$/) do
  visit'https://nobalk-imlbf.c9.io/login'
  @user = User.create!(
    :name => "danilo",
    :email =>"danilo@danilo.com",
    :password => "danilo",
    :activated => true
  )
  fill_in 'username', :with => 'danilo@danilo.com'  

  fill_in 'password', :with => 'danilo'  

  click_button("Entrar")
  assert_current_path('/admin')
end

When(/^I press the button empresas/) do
  click_button("EMPRESAS") 
end
  
Then(/^I should see my empresas list$/) do
  assert_current_path('/empresas')
end

Then(/^I click in the button$/) do
  click_link("Nike")
end

And(/^I choose another enterprise$/) do
  visit"http://nobalk-imlbf.c9.io/active?empresaN=1"
end

Then(/^I should see the switch of enterprises$/) do
  visit"http://nobalk-imlbf.c9.io/empresas"
end


 