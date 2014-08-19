class User

	attr_reader :name, :age, :contact
	
	def initialize(user_details)
		@name = user_details[0]
		@age = user_details[1].to_i
		@contact = user_details[2].to_i
	end

	def get_user_details
		{name: name, age: age, contact: contact}
	end
end	
