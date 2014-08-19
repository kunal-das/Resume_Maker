require "spec_helper"
require_relative "../lib/ResumeBuilder.rb"
require_relative "../lib/csv_writer.rb"

describe "ResumeBuilder" do
	let(:resume) { ResumeBuilder.new }

	it "creates a user object" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["csv", "name", 23, 2315496825])
		expect(resume.create_user.class).to eql(User)
		expect(resume.user.name).to eql("name")
	end

	it "writes to a csv file" do
		ResumeBuilder.any_instance.stub(:prompt).and_return(["csv", "name", 23, 2315496825])
		#resume.user = User.new(["something", 23, 123456796])
		resume.create_user
		CSVWriter.any_instance.should_receive(:write_to_file)
		resume.write_file

		#expect(resume.format.include?("csv")).to eql(true)
		#expect()
	end

end
