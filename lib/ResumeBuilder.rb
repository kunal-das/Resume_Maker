#require_relative "./plugins/csv_writer.rb"
#require_relative "./plugins/pdf_writer.rb"
#require_relative "./plugins/txt_writer.rb"
require_relative "./file_exporter.rb"
require_relative "./user.rb"

class ResumeBuilder

	attr_reader :format, :user
	
	def prompt
		puts "enter your name"
		name =  gets.chomp
		puts "enter your age"
		age = gets.chomp
		puts "enter your contact number"
		contact = gets.chomp
		print "enter the format you want your resume to be in\n"
		#puts get_supported_formats.keys
		puts FileExporter.plugin_list.keys
		format = gets.chomp
		#puts "./plugins/"+format+"_writer"
		return [format, name, age, contact]
	end

	
	def get_supported_formats
		@supported_formats = { }
		file = File.open("./plugins/plugins.txt", "r")
		file.each_line do |line|
			line_split = line.split(",")
			@supported_formats[line_split[0]] = line_split[1].chomp
		end
		@supported_formats		
	end


	def load_plugins
		$dir = Dir["./plugins/*.rb"].each {|file| require_relative file}
	end

	def create_user
		@format, *@user_details = prompt
		@user = User.new(@user_details)
	end

	def write_file
		if user.valid_user_data
			writer = Object.const_get(FileExporter.plugin_list[format]).new(user)
			writer.write_to_file
		else
			puts "You have entered an invalid data...Please try again"
		end
	end
end
