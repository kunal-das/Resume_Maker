require "spec_helper"
require_relative "../lib/plugins/txt_writer.rb"
require_relative "../lib/user.rb"
require_relative "../lib/file_exporter.rb"

describe "TXTWriter" do
	let(:user) {User.new(["Kunal", "22", "9945401604"])}
	let(:txt_file) { TXTWriter.new(user)}
	subject { txt_file }

	it "formats the user's data" do
		expect(txt_file.formatter).to eql("Name: Kunal, Age: 22, Contact: 9945401604")
	end

	it "creates a file with user's name" do
		expect(txt_file.filename).to eql("Kunal.txt")
	end
end
