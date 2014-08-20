class TXTWriter

	def initialize(user_data)
		@user_data = user_data
	end

	def formatter
		"#{@user_data[:name]}\t#{@user_data[:age]}\t#{@user_data[:contact]}"
	end

	def filename
		"#{@user_data[:name]}.txt"
	end

	def write_to_file
		File.open(filename, "w") do |file|
			file.write "Name\t\tAge\tContact\n"
			file.write formatter
		end
	end
end


