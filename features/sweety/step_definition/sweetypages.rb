class SweetyPages < Page
	def self.useNameField() element :id, "user_email"	end
	def self.passField() element :id, "user_password"	end
	def self.loginButton() element :xpath, ".//input[@value='Log in']"	end


	def self.do_enterUNandPAss un,pass
		useNameField.clear
		useNameField.send_keys un
		passField.clear
		passField.send_keys pass
		loginButton.click
	end
	
	
end

class SweetyHomePage < Page
	def self.welcomeText() element :xpath, ".//*[@id='page-content-wrapper']/div/div[1]" end
	def self.levelLink() element :link, "Levels"	end
	def self.reportLink() element :link, "Reports" end
	def self.pageHedder() element :xpath, ".//*[@id='page-content-wrapper']/div/div[1]/div/h2"	end
	def self.addnewLink() element :link, "Add new"	end
	def self.selectYear() select :id, "entry_recorded_at_1i"	end
	def self.selectMonth() select :id, "entry_recorded_at_2i"	end
	def self.selectDate() select :id, "entry_recorded_at_3i"	end
	def self.levelInput() element :id, "entry_level"	end
	def self.submitButton() element :name, "commit"	end
	def self.dailyReportText() element :xpath, ".//*[@id='page-content-wrapper']/div/div[2]/div[1]/div/div[1]/h3"	end
	def self.reportHeadertext() element :xpath, ".//*[@id='page-content-wrapper']/div/div[2]/div[1]/div/div[2]/table/thead/tr" end
	
	
	
	def self.do_getReportHeaderText
		txt=reportHeadertext.text
		return txt
	end
	def self.do_verifyDailyReport
		if dailyReportText.text.include?("Daily Report as of")
			return true
		else
			return false
		end
	end
	def self.do_submit
		submitButton.click
	end
	def self.do_entertLevel opt
		levelInput.clear
		levelInput.send_keys("#{opt}")
	end
	def self.do_selectDate
		selectDate.select_by(:text, "16")
	end
	def self.do_selectMonth
		selectMonth.select_by(:value, "8")
	end
	def self.do_selectYear
		selectYear.select_by(:text, "2016")
	end
	def self.do_clickAddNewLink
		addnewLink.click
	end
	def self.do_clickLevelLink
		levelLink.click
	end
	def self.do_clickReportLink
		reportLink.click
	end
	def self.do_getPageHedderText
		returnText=pageHedder.text
		return returnText
	end
	def self.do_verifyHomePage
		if welcomeText.text.include?("Signed in successfully")
			return true
		else
			return false
		end
	end
	def self.do_getEntryConfirmText
		txt=welcomeText.text
		return txt
	end
end
