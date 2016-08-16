
Feature: Sweety Test Scenarios

Background:
	
Scenario:   Sweety Login
	When I am login to Sweety Site
	Then Home page should be displayed
	
Scenario: Verify End to End scenario which include Login, Entry and Report
	When I am login to Sweety Site
	Then Home page should be displayed
	When I click on "Levels" link on Home Page
	Then "Levels" Page should display
	When I add four entries for today
	Then Entry was successfully created mesage should display
	When I click on "Reports" link on Home Page
	Then "Reports" Page should display
	And Daily report should be display with Min,Max and Avg value