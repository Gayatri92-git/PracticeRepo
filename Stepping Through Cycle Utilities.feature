Feature: Stepping Through Cycle Utilities

@wip @public
Scenario: Calulating Number of Stairs
#############################################################
# Description: This scenario multiplies the number of stairs
#  by the number of floors and returns the results
# Inputs:
# 	Required:
# 		floors - The number of floors a building has. To be multiplied by steps
# 		steps - The number of stairs in a floor. To be multiplied by floors
# Outputs:
# 	floors - the number of stairs in a given building
#############################################################
Given I assign $floors to variable "total_steps"
When I multiply variable "total_steps" by $steps