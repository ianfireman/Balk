  Given(/^I am in the nobalk's sign in page$/) do
    visit'https://bigboss-dmop.c9users.io/login'
    @user = User.create!(
             :name => "danilo",
             :email =>"danilo@danilo.com",
             :password => "danilo"	,


             
)
@user.activated = true

@user.save!

end

  Then(/^I  fill the email camp$/) do
    fill_in 'username', :with => 'danilo@danilo.com'  
    end
  Then(/^I  fill the senha camp$/) do
    fill_in 'password', :with => 'danilo'  
  end
  When(/^I press entrar$/) do
      click_button("Entrar")

  end
Then(/^I should see my homepage on the site$/) do
  visit'https://bigboss-dmop.c9users.io/admin'

end

 