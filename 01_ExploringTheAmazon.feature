Feature: Exploring the Amazon

Background:
#Given I "import relevent utilities"
#And I "define variables"
Given I import scenarios from "Utilities/01_ExploringTheAmazon_Utilities.feature"
And I assign "chrome" to variable "browser"
And I assign "https://www.amazon.com" to variable "dstWebPage"

@directions
#Scenario: Directions
#Given I "import the utilities associated with this test in the background"
#When I "define the variables neccisary to utilize the 'Open Browser to #Specified Page' utility in the background"
#And I "call upon the 'Open Browser to Specified Page' utility in the main #scenario"
#And I "then add a step that verifies that we are on the Amazon home page"

#Scenario: Exploring the Amazon
#Given I "open the browser and navigate to the Amazon digital store"
Scenario: Exploring the Amazon
Given I "open the browser and navigate to the Amazon digital store"
And I execute scenario "Open Browser to Specified Page"
And I navigate to $dstWebPage in web browser


