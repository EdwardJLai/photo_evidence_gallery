Feature: display list of movies that has at least one tag matching the search

Background: I am on the homepage
	
	Given the following images exist:
  | Caption        | Tags | Incident name | Operational period| Team number | content type	| file name   |
  | Tree           | a    | Kevin				  | January			  		| team 2			| what		 			| tree.jpg    |
  | Fish           | b    | Craig 		  	| February		  		| team 2			| does					| fish.jpg    |
  | Shoe           | c    | Will	 		 		| March			  			| team 4			| this					| shoe.jpg    |
  | Sunglasses     | d    | Chris	 		  	| Never			  			| team 6			| do						| glasses.jpg |  
	
Scenario: search finds one photo
	When I search for "Sunglasses"
	Then I should see the image Sunglasses
Scenario: search finds multiple photos
	When I search for "team 2"
	Then I should see the image Tree
	And I should see the image Fish
Scenario: search can't find anything
	When I search for "May"
	Then I should see "No images match"