class User

	attr_reader :name, :age, :contact
	
	def initialize(user_details)
		@name = user_details[0]
		@age = user_details[1]
		@contact = user_details[2]
	end

	def get_user_details
		{name: name, age: age, contact: contact}
	end

	def get_user_details_in_string
		"Name: #{name}, Age: #{age}, Contact: #{contact}"
	end

	def get_user_details_for_csv
		"#{name},#{age},#{contact}"
	end

	def headings
		"Name, Age, Contact"
	end

	
	def valid_name
		name =~ /^[a-zA-Z]{3,15}$/
	end

	def valid_age
		age =~ /^(0?[1-9]|[1-9][0-9])$/
	end

	def valid_contact
		contact =~ /^[0-9]{10}$/
	end

	def valid_user_data
		valid_name && valid_age && valid_contact
	end
end	
