
Given /the following images exist/ do |pictures_table|
  pictures_table.hashes.each do |pic|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Photo.create!(pic)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"
  first = page.body.index(e1) or assert false
  second = page.body.index(e2) or assert false
  assert second > first
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
	rating_list.split(', ').each do |ratings|
		if uncheck
			When %{I uncheck "ratings_#{ratings}"}
		else
			When %{I check "ratings_#{ratings}"}
		end
	end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  assert page.all("table tr").count.should == Movie.all.length+1
end
