  Given(/^I am logged on Nobalk$/) do
     
     visit'https://bigboss-dmop.c9users.io/login'
    @user = User.create!(
             :name => "danilo",
             :email =>"danilo@danilo.com",
             :password => "danilo"	,	 
             
)
@user.activated = true

@user.save!

    fill_in 'username', :with => 'danilo@danilo.com'  

    fill_in 'password', :with => 'danilo'  

      click_button("Entrar")
  visit'https://bigboss-dmop.c9users.io/admin'
      #assert_current_path('https://nobalk-imlbf.c9.io/pedidos')
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


 