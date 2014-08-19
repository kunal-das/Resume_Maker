require "csv"

class CSVWriter
	def initialize(user_data)
		@user_data = user_data
	end

	def formatter(user_data)
		"Name: #{user_data[:name]}, Age: #{user_data[:age]}, Contact: #{user_data[:contact]}".split(/,/)
	end

	def filename(user_data)
		"#{user_data[:name]}.csv"
	end

	def write_to_file
		CSV.open(filename(@user_data), "a+") do |csv|
			csv << formatter(@user_data)
		end
	end

end
