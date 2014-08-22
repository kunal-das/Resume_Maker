require 'spec_helper'
require_relative '../lib/file_exporter'
require_relative '../lib/user.rb'

describe "file exporter" do
	
	it "should initialize empty plugin list" do
		expect(FileExporter.plugin_list).to be_empty
	end

	it "should have a method to register plugins" do 
		FileExporter.register_plugin "csv", self.class
		key = FileExporter.plugin_list.keys.first
		value = FileExporter.plugin_list.values.first
		expect(key).to eql "csv"
		expect(value).to eql self.class
	end

	it "should be  accesible from a subclass" do
		class DummyExporter < FileExporter
			register_plugin("txt", "DummyExporter")
		end

		key = FileExporter.plugin_list.keys.last
		value = FileExporter.plugin_list.values.last
		expect(key).to eql "txt"
		expect(value).to eql("DummyExporter")
	end

	it "should have user's details" do
		user = User.new(["Kunal", "22", "9945401604"])
		file_export = FileExporter.new(user)
		expect(file_export.file.name).to eql("Kunal")
	end
end
