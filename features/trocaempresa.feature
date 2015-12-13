Feature:Enterprise system
  
Scenario:Switch enterprises
    Given I am logged on Nobalk
    When I click in the button enterprise
    Then I should see my enterprise list
    And I click in the button new enterprise
    Then I should see new enterprise page
    And I fill the fields
    And I click in the button save enterprise
    And I select Empresao for active empresa
    Then I should see clientes page