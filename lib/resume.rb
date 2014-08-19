require_relative "./resume_builder.rb"

resume = ResumeBuilder.new
resume.create_user
resume.write_file
