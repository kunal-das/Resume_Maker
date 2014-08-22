require_relative "../file_exporter.rb"

class TXTWriter < FileExporter

	register_plugin("txt", "TXTWriter")	

	def formatter
		"#{file.get_user_details_in_string}"
	end

	def filename
		"#{file.get_user_details[:name]}.txt"
	end

	def write_to_file
		File.open(filename, "w") do |file|
			file.write formatter.split(", ").join("\n")
		end
	end
end

