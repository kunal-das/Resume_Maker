require_relative "./csv_writer.rb"
require_relative "./user.rb"

class ResumeBuilder

	attr_accessor :format, :user
	
	def prompt
		puts "enter your name"
		name =  gets.chomp
		puts "enter your age"
		age = gets.chomp
		puts "enter your contact number"
		contact = gets.chomp
		puts "enter the format you want your resume to be in"
		format = gets.chomp
		return [format, name, age, contact]
	end

	def create_user
		@format, *@user_details = prompt
		@user = User.new(@user_details)
	end

	def write_file

		if @format.include?("csv")
			csv_writer = CSVWriter.new(@user.get_user_details)
			csv_writer.write_to_file		
		end
	end
end


