require 'features/support/page'
require 'rspec'


When(/^I am login to Sweety Site$/) do
  puts "In login Page"
  puts url=@config.url
  SweetyPages.go url
  
  puts userName=@config.username
  puts password=@config.password
  SweetyPages.do_enterUNandPAss userName,password
end
Then(/^Home page should be displayed$/) do
 puts "In Home Page"
 result=SweetyHomePage.do_verifyHomePage
 
 if result==true
     puts "Home Page is displayed"
 else
     puts "Home Page is not displayed"
 end
 result.should be true
end
When /^I click on "([^\"]*)" link on Home Page$/ do |link|
  if link=="Levels"
    SweetyHomePage.do_clickLevelLink
  elsif link=="Reports"
    SweetyHomePage.do_clickReportLink
  end
end
Then /^"([^\"]*)" Page should display$/ do |opt|
  puts resultText=SweetyHomePage.do_getPageHedderText
  
  if opt=="Levels" and resultText.include?("Level Entries")
    puts "#{opt} Page is seen"
    result=true
  elsif opt=="Reports" and resultText.include?("Level Reports")
    puts "#{opt} Page is seen"
    result=true
  else
    result=false
  end
  result.should be true
end
When /^I add four entries for today$/ do
  i=10
  while i<14
    steps %Q{When I click on Add New button on Level Page
	And Add a entry for blood sugar level "#{i}"}
    i=i+1
  end
  
end
  
When /^I click on Add New button on Level Page$/ do
  SweetyHomePage.do_clickAddNewLink
end
And /^Add a entry for blood sugar level "([^\"]*)"$/ do |level|
  SweetyHomePage.do_selectYear
  SweetyHomePage.do_selectMonth
  SweetyHomePage.do_selectDate
  SweetyHomePage.do_entertLevel level
  SweetyHomePage.do_submit
end
Then /^Entry was successfully created mesage should display$/ do
  puts returnTxt=SweetyHomePage.do_getEntryConfirmText
  if returnTxt.include?("Entry was successfully created")
    result=true
  else
    result=false
  end
  result.should be true
end
And /^Daily report should be display with Min,Max and Avg value$/ do
  result=SweetyHomePage.do_verifyDailyReport
  if result==true
    puts "Daily report is seen"
  else
    puts "Daily report is not seen"
  end
  result.should be true
  resultTxt=SweetyHomePage.do_getReportHeaderText
  if resultTxt.include?("Min") and resultTxt.include?("Max") and resultTxt.include?("Avg")
    puts "Report is seen with Min, max and Avg value"
    result1=true
  else
    puts "Report is not seen with Min, max and Avg value"
    result1=false
  end
  result1.should be true
end







