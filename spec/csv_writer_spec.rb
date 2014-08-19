require "spec_helper"
require_relative "../lib/csv_writer.rb"
require_relative "../lib/user.rb"

describe "CSVWriter" do
	let(:user){User.new(["Kunal", "22", "9945401604"])}
	let(:csv_file){CSVWriter.new(user.get_user_details)}
	subject{ csv_file }

	it "formats the user data" do
		expect(csv_file.formatter(user.get_user_details)).to eql("Name: Kunal, Age: 22, Contact: 9945401604")
	end	

	it "creates a file with the user's name" do
		expect(csv_file.filename(user.get_user_details)).to eql("Kunal.csv")
	end
end
