class Teacher < ActiveRecord::Base
	belongs_to :subject




	def to_s
		"#{first_name} #{last_name}"
	end
end
