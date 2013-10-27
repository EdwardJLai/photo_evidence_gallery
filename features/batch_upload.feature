Feature: upload multiple movies

Background: I am on the homepage

  Given I am on the PhotoApp homepage

Scenario: I upload one image
  When I follow "Multiple Uploads"
	And I upload the image "Water.jpg"
	And I press "Save Photos"
	Then I should see "multiple images uploaded"
	When I press "Back"
	Then I should be on the PhotoApp homepage
	And I should see 1 image

Scenario: I upload multiple images which Capybara can't do
  When I follow "Multiple Uploads"
  And I upload the following images: "Water.jpg" "4985688_orig.jpg"
  And I press "Save Photos"
	Then I should see "multiple images uploaded"
	When I press "Back"
	Then I should be on the PhotoApp homepage
	And I should see 2 images

Scenario: I upload no images
  When I follow "Multiple Uploads"
  And I press "Save Photos"
  Then I should see "No files chosen!"
