
Feature: Sweety Test Scenarios

Background:
	
Scenario:   Sweety Login
	When I am login to Sweety Site
	Then Home page should be displayed
	
Scenatio: Verify End to End scenario which include Login, Entry and Report
	When I am login to Sweety Site
	Then Home page should be displayed
	When I click on "Levels" link on Home Page
	Then "Level Entries" Page should display
	When I click on Add New button on Level Page
	