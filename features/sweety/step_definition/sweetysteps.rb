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
