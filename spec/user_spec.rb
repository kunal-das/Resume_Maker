require "spec_helper"
require_relative "../lib/user.rb"

describe "User" do
	let(:user) { User.new(["Kunal", "22", "9945401604"])  }
	
	it "has a valid name" do
		expect(user.valid_name).not_to be_nil
	end

	it "has a valid age" do
		expect(user.valid_age).not_to be_nil
	end

	it "has a valid contact" do
		expect(user.valid_contact).not_to be_nil
	end

	it "has valid user data" do
		expect(user.valid_user_data).not_to be_nil
	end

	it "return a user details hash" do
		expect(user.get_user_details).to eql({name: "Kunal", age: "22", contact: "9945401604"})
	end

	it "returns user's details in string format" do
		expect(user.get_user_details_in_string).to eql("Name: Kunal, Age: 22, Contact: 9945401604")
	end

	it "returns user's details for csv format" do
		expect(user.get_user_details_for_csv).to eql("Kunal, 22, 9945401604")
	end
end
