Feature:Have a personal account

Scenario:Login in Nobalk site
  Given I am in the nobalk's sign in page
	Then I  fill the email camp
	And I  fill the senha camp 
	When I press entrar
	Then I should see my homepage on the site
