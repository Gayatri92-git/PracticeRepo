###########################################################
# Name: Gayatri Chakkarwar
# Date: 20-JULY-2021
# Description: To test Telehack
############################################################ 
Feature: My Feature

Scenario: Connecting Telehack
#connect to Telehack.com
Given I "open local terminal"
When I open terminal connected to "telehack.com" sized to 24 lines and 77 columns
And I "Can see the terminal window is wide and can get all the information"
And I wait 5 seconds

#Capture zork description
Scenario Outline:Read Telehack file
CSV Examples: Datasets/Telehack.csv
Given I "Read Telehack file"
When I enter "help" in terminal
And I "able to see the information on the page"
And I wait 5 seconds
#And I press keys "Enter" in terminal 45 times with 1 seconds delay
While I do not see <help_name> in terminal
And I move cursor DOWN in terminal
EndWhile
And I wait 5 seconds
And I copy terminal line 15 columns 32 through 40 to variable "Description"
And I echo $Description
Given I assign chevron variables "help_description" to dollar variables
If I verify text $help_description is equal to $Description
Then I echo "Description name is same as in the dataset file"
EndIf
And I press keys "Enter" in terminal

Scenario: Rolls
#Verify Rolls
When I enter "roll" in terminal
And I wait 10 seconds
#Then I copy terminal line 7 from column 6 through next 1 columns to variable "num1"
#Then I copy terminal line 7 from column 16 through next 1 columns to variable "num2"
Then I copy terminal line 7 columns 6 through 7 to variable "num1"
And I copy terminal line 7 columns 16 through 17 to variable "num2"
And I wait 10 seconds
When I type "calc" in terminal
And I press keys TAB in terminal
And I type $num1 in terminal
And I type "+" in terminal
And I type $num2 in terminal
And I press keys ENTER in terminal
And I wait 5 seconds
#And I save screenshot
Then I copy terminal line 9 columns 2 through 3 to variable "res"
And I echo $res
If I verify number $res is less than 13
Then I echo "Sum of two number is beneath 13"
EndIf
And I enter "?" in terminal
And I wait 5 seconds

Scenario: Start Zork
#Start Zork
When I enter "zork" in terminal
#And I press keys ENTER in terminal
And I wait 5 seconds
#Then I locate "Release" after line 17 column 1 in terminal
When I locate "Release" in terminal
Then I wait 5 seconds
And I copy terminal line 18 columns 1 through 10 to variable "zork_release"
And I echo $zork_release
#And I press keys ENTER in terminal
And I wait 5 seconds

#In Zork, Enter the House
#go south
When I type "Go South" in terminal
And I press keys ENTER in terminal
Once I See "South of House" in terminal
Then I echo "I am in right direction"
And I wait 2 seconds

#go east
When I type "Go East" in terminal
And I press keys ENTER in terminal
Once I See "Behind House" in terminal
Then I echo "I am in right direction"
And I wait 2 seconds

#open the window
When I type "Open Window" in terminal
And I press keys ENTER in terminal
Once I see "allow entry" in terminal
Then I echo "You are allowed to take entry"
And I wait 2 seconds

#enter window
When I type "Enter Window" in terminal
And I press keys ENTER in terminal
And I wait 2 seconds
Once I see "Kitchen" in terminal
Then I echo "You made entry in the Kitchen"
And I wait 5 seconds

Scenario: Die by a Grue
#Die by a Grue
When I type "go up" in terminal
And I press keys ENTER in terminal
And I wait 3 seconds
Once I see "pitch black" in terminal
Then I echo "You are likely to be eaten by a grue."
And I wait 2 seconds
When I type "go north" in terminal
And I press keys ENTER in terminal
And I wait 3 seconds
While I do not see "Oh, no!" in terminal
Then I enter "go north" in terminal
EndWhile
Then I echo "You walked into the slavering fangs of a lurking grue!"
And I wait 5 seconds
Then I copy terminal line 7 from column 1 through next 63 columns to variable "grue_message"
And I echo $grue_message

Scenario: Return Home Screen
#Return to the Home Screen
When I type "quit" in terminal
And I press keys ENTER in terminal
Once I see "Are you sure you want to quit?" in terminal
#And I wait 5 seconds
Then I type "yes" in terminal
And I press keys ENTER in terminal
And I enter "?" in terminal
And I wait 5 seconds

Scenario:Echo Results
#Echo Results
Given I create list "EchoResults"
And I prepend element $Description to list "EchoResults"
And I append element $res to list "EchoResults"
And I append element $zork_release to list "EchoResults"
And I append element $grue_message to list "EchoResults"
And I echo $EchoResults
#And I sort list "EchoResults"