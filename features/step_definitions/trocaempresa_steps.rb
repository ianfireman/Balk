  Given(/^I am logged on Nobalk$/) do
  visit'https://fodasse-dmop.c9users.io/admin'
  end
  
  Then(/^I click in the button$/) do
    visit"https://fodasse-dmop.c9users.io/empresas"
    end
  And(/^I choose another enterprise$/) do
    visit"https://fodasse-dmop.c9users.io/empresas"
    end
  Then(/^I should see the switch of enterprises$/) do
  visit"https://fodasse-dmop.c9users.io/admin"
  end


 