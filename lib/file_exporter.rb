class FileExporter
	
	@@plugin_list = { }
	
	attr_reader :file

	def initialize(user_data)
		@file = user_data
	end

	class << self
		def plugin_list
			@@plugin_list
		end	

		def register_plugin display_name, class_name
			@@plugin_list[display_name] = class_name
		end	
	end	

end
