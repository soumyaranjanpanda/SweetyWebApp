class BaseConfig
	def self.prop item_name, item_value
		define_method item_name.to_s do
			item_value
		end
	end
end