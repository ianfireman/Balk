Given(/^I am logged on Nobalk$/) do
  visit'https://nobalk-imlbf.c9.io/login'
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

When(/^I click in the button enterprise$/) do
  click_link("EMPRESAS") 
end
  
Then(/^I should see my enterprise list$/) do
  assert_current_path('/empresas')
end

And(/^I click in the button new enterprise$/) do
  click_link("Cadastrar Empresa") 
end

Then(/^I should see new enterprise page$/) do
  assert_current_path('/empresas/new')
end

And(/^I fill the fields$/) do
  fill_in 'nome_empresa', :with => 'Empresao' 
  fill_in 'email_empresa', :with => 'empresao@danilo.com'
  fill_in 'cnpj_empresa', :with => '123456' 
  fill_in 'razao_empresa', :with => 'empresao'
end

And(/^I click in the button save enterprise$/) do
  assert_difference('Empresa.count') do
    click_button("Salvar Empresa") 
  end
end

And(/^I select Empresao for active empresa$/) do
  click_link("Empresao")
end

Then(/^I should see clientes page$/) do
  assert_current_path('/clientes')
end