require "csv"
require_relative "../file_exporter.rb"

class CSVWriter < FileExporter
	
	register_plugin("csv", "CSVWriter")

	def formatter
		"#{file.get_user_details_for_csv}".split(/,/)
	end

	def filename
		"#{file.get_user_details[:name]}.csv"
	end

	def write_to_file
		CSV.open(filename, "a+") do |csv|
			csv << file.headings.split(/,/)
			csv << formatter
		end
	end
end
