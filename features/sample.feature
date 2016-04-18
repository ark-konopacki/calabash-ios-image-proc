Feature: Sample Feature

Scenario: Sample Scenario
  Given the app has launched
  And I should see image "switch_off.png"
  When I can tap on image "switch_off.png"
  Then I should see image "switch_on.png"
  And I can tap on image "switch_on.png"
