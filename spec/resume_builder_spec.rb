require "spec_helper"
require_relative "../lib/ResumeBuilder.rb"
require_relative "../lib/plugins/csv_writer.rb"
require_relative "../lib/plugins/txt_writer.rb"
require_relative "../lib/plugins/pdf_writer.rb"
#require_relative "../lib/plugins/plugins.txt"

describe "ResumeBuilder" do
	let(:resume) { ResumeBuilder.new }

	it "creates a user object" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["csv", "name", 23, 2315496825])
		expect(resume.create_user.class).to eql(User)
		expect(resume.user.name).to eql("name")
	end

	it "identifies the csv format" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["csv", "name", 23, 2315496825])
		#resume.user = User.new(["something", 23, 123456796])
		resume.create_user
		expect(resume.format).to eql("csv")
		#CSVWriter.any_instance.should_receive(:write_to_file)
		#resume.write_file

		#expect(resume.format.include?("csv")).to eql(true)
		#expect()
	end

	it "identifies the txt format" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["txt", "name", 23, 2315496825])
		#TXTWriter.any_instance.should_receive(:write_to_file)
		resume.create_user
		expect(resume.format).to eql("txt")
		#resume.write_file
	end

	it "identifies the pdf format" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["pdf", "name", 23, 2315496825])
		#TXTWriter.any_instance.should_receive(:write_to_file)
		resume.create_user
		expect(resume.format).to eql("pdf")
		#resume.write_file
	end

	it "gets the supported formats in hash" do
		#resume.load_plugins
		hash = resume.get_supported_formats
		expect(hash.keys.include?("csv")).to eql(true)
		expect(hash.keys.include?("txt")).to eql(true)
	end
end
