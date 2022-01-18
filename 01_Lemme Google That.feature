Feature: Lemme Google That

Background:
Given I assign "chrome" to variable "browser"
Given I assign "https://www.google.com" to variable "dstWebsite"
Given I assign "Tryon Solutions" to variable "searchPhrase"

@wip 
Scenario: Directions
Given I "have set cycle up to run webtest"
	When I "have downloaded the WebDriver"
    And I "have pointed Cycle towards the WebDriver"

When I "define variables in the Background"
	When I "define the variable browser and set it to Chrome"
    And I "define the variable dstWebsite and set it to http://www.google.com"
    And I "define the variable searchPhrase and set it to 'Tryon Solutions'"

And I "add steps in the main scenario to open the web browser, navigate to the destination website, wait 2 seconds, and then close the web browser"

@directions
Scenario: Lemme Google That
Given I open $browser web browser
Then I navigate to $dstWebsite in web browser within 5 seconds
And I wait 2 seconds
And I see element "xPath://input[@name='q']" in web browser
#Then I type $searchPhrase in web browser
#And I press keys enter
#And I close web browser