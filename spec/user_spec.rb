require "spec_helper"
require_relative "../lib/user.rb"

describe "User" do
	let(:user) { User.new(["Kunal", "22", "9945401604"])  }
	
	it "has a valid name" do
		#user = User.new "Kunal", 22
		expect(user.name).not_to be_nil
		expect(user.name).to eql("Kunal") 
	end

	it "has a valid age" do
		#user = User.new "Kunal", 22
		expect(user.age).not_to be_nil
		expect(user.age).to be_integer
		expect(user.age).to eql 22
	end

	it "has a valid contact number" do
		expect(user.contact).not_to be_nil
		expect(user.contact).to be_integer
		expect(user.contact).to eql(9945401604)
	end

	it "return a user details hash" do
		expect(user.get_user_details).to eql({name: "Kunal", age: 22, contact: 9945401604})
	end
end
