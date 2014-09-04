require_relative "../file_exporter.rb"

class PDFWriter < FileExporter

	register_plugin("pdf", "PDFWriter")

	def formatter
		"#{file.get_user_details_in_string}"
	end

	def filename
		"#{file.get_user_details[:name]}.pdf"
	end
	
	def write_to_file
		File.open(filename, "w") do |file|
			file.write formatter
		end
	end
end
