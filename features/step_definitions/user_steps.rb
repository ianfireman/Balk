Given /^I am logged in as a user$/ do
  @current_user = User.create!(:username => 'user', :password => 'password')
  login_as(@current_user, :scope => :user)
end

Given /^I log out$/ do
  logout
end