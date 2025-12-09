# Given, When, Then, And, But, Or
# The sentences can't be repeated, so if you are doing something twice then the two sentences need 
# to be written differently (e.g. below we have two sentences about clicking on Next button)

Feature: Gmail Functionality Test
Description: THIS IS USED TO ADD MORE CONTEXT AND IN DEPTH DESCRIPTION (IF NEEDED)

# Use "Background" to define steps that are common to all scenarios within this feature
# e.g. we may want to ensure the user is already on the Gmail page before each scenario starts
Background:  User is on Gmail page

# If you place a tag above the Feature keyword, it applies to all scenarios in that feature.
# In this case, the "@Regression" tag applies only to the scenario immediately below it.

@Regression
Scenario: To verify that the user is able to login with valid credentials
Given User is on Gmail page
# We have hardcoded the "email" and "phone number" as strings which is not good practice as these details can change, 
# this will then require a lot of manual changes in each test that uses them!!
When User enters "email" or "phone number" 
And User clicks on Next button
And User enters password
And User clicks on Next button again
Then User should be logged into their Gmail account successfully
And User should see gmail logo on left side

# "Scenario Outline" is used when you want to run the same scenario multiple times with different data sets.
# Each "Scenario Outline" must include an "Examples" section containing those data sets.
# "Scenario Outline" involves using a Data Table, that's why we don't just write "scenario" like above

# The Scenario Outline runs once for each row in the Examples table, substituting placeholders like 
# <userID> and <password> each time which is dynamic.

Scenario Outline: To verify that the user is not able to login with invalid credentials
Given User is on Gmail page
When User enters invalid email or phone number as "<userID>"
And User clicks on Next button
And User enters password as "<password>"
And User clicks on Next button again
Then User should get error 
And User should see some error popup

Examples:

|userID     | password  |
| Test123@gmail.com|    Test123|
| Test555@gmail.com|    Test555|