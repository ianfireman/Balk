  Given(/^I m in my admin page on nobalk$/) do
  visit'https://fodasse-dmop.c9users.io/admin'
  end
  
  When(/^I press the button collections$/) do
   click_link "/collections"
    end
  
  Then(/^I should see my collections list$/) do
      visit'https://fodasse-dmop.c9users.io/collections'
end
