Feature:Colections page

Scenario:Acess collections page
	Given I m in my admin page on nobalk
	When I press the button collections
	Then I should see my collections list
	Then I should click in new collections
	And I fill the blanks