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
	
	def self.do_verifyHomePage
		if welcomeText.text.include?("Signed in successfully")
			return true
		else
			return false
		end
	end
end
