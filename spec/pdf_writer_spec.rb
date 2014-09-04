require "spec_helper"
require_relative "../lib/plugins/pdf_writer.rb"
require_relative "../lib/user.rb"

describe "PDFWriter" do
	let(:user) {User.new(["Kunal", "22", "9945401604"])}
	let(:pdf_file) { PDFWriter.new(user)}
	subject { pdf_file }

	it "formats the user's data" do
		expect(pdf_file.formatter).to eql("Name: Kunal, Age: 22, Contact: 9945401604")
	end

	it "creates a file with user's name" do
		expect(pdf_file.filename).to eql("Kunal.pdf")
	end
end
