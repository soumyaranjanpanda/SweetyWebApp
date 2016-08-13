class Page
	@@driver = nil
	@@config = nil
	
	def Page.driver
	    @@driver
	end
	def Page.driver=(value)
	    @@driver=value
	end
	
	def Page.config
	    @@config
	end
	
	def Page.config=(value)
	    @@config=value
	end
	
	
	def Page.element how, what
	    wait = Selenium::WebDriver::Wait.new(:timeout => 60) # seconds
            wait.until {driver.find_element how, what}
	end

	def Page.select how, what
	    Selenium::WebDriver::Support::Select.new(Page.element how, what)
	end
	
	def Page.go url
		puts url
                @@driver.manage.delete_all_cookies
                driver.navigate.to url
	end   
    
        def Page.is_elementPresent how, what
            begin
            sleep 1
            driver.find_element how, what
            return true
            rescue Selenium::WebDriver::Error::NoSuchElementError
                #puts 'elemnet not seen'
                return false
            end
        end
end
