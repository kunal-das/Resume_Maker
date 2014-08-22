require_relative "./ResumeBuilder.rb"


resume = ResumeBuilder.new
resume.load_plugins
resume.create_user
resume.write_file
