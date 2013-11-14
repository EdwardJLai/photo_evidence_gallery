@wip
Feature: crop photos with different masks

Background: I am on a page of a photo. 
	
	Given I am logged in as a valid user
	And I am on the New photo page
	
@wip
Scenario: use a custom crop
	When I crop the image to 400 by 200
	Then I press "Create Photo"
	And I follow Back
	Then I should see "Photoname"
	And "Photoname"'s size should be 400 by 200
@wip
Scenario: use a square mask
	When I set the height to 200 pixels
	And I press "Create Photo"
	And I follow Back
	Then I should see "Photoname"
	And "Photoname"'s size shoud be 200 by 200
@wip
Scenario: use a portrait mask
	When I set the width to 300 pixels
	And I press "Create Photo"
	And I follow Back
	Then I should see "Photoname"
	And "Photoname"'s size shoud be 300 by 485.4
@wip
Scenario: use a landscape mask
	When I set the height to 300 pixels
	And I press "Create Photo"
	And I follow Back
	Then I should see "Photoname"
	And "Photoname"'s size shoud be 485.4 by 300
