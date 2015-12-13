Given(/^I m in my admin page on nobalk$/) do
  visit'https://nobalk.imlbf.c9.io/login'
  @user = User.create!(
    :name => "danilo",
    :email =>"danilo@danilo.com",
    :password => "danilo",
    :activated => true
  )
  @empresa = @user.empresas.build({"nome_fantasia"=>"Test", "email"=>"test@test.com", "cnpj"=>"1234", "razao_soc"=>"1234"})
  @empresa.save
  @user.active_empresa = @empresa.id
  @user.save
  
  fill_in 'username', :with => 'danilo@danilo.com'  

  fill_in 'password', :with => 'danilo'  

  click_button("Entrar")
  assert_current_path('/admin')
end
  
When(/^I press the button collections$/) do
  click_link("Coleções") 
end
  
Then(/^I should see my collections list$/) do
  assert_current_path('/collections')
end


Then(/^I should click in new collections$/) do
  click_link("Nova Coleção")
end
And(/^I fill the blanks$/) do
  fill_in 'name', :with => 'Sarude dandstorm'
  
  
end





