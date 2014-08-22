require "spec_helper"
require_relative "../lib/plugins/csv_writer.rb"
require_relative "../lib/user.rb"

describe "CSVWriter" do
	let(:user){User.new(["Kunal","22","9945401604"])}
	let(:csv_file){CSVWriter.new(user)}
	subject{ csv_file }

	it "formats the user data" do
		expect(csv_file.formatter).to eql(["Kunal", "22", "9945401604"])
	end	

	it "creates a file with the user's name" do
		expect(csv_file.filename).to eql("Kunal.csv")
	end
end
