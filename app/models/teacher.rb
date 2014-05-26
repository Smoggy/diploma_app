class Teacher < ActiveRecord::Base
	belongs_to :subject




	def self.find_by_filters filters
		teachers = if filters[:subject]
			self.joins(:subject).where("subject.name = ?", filters[:subject])
		else
			all
		end
	end


	def to_s
		"#{first_name} #{last_name}"
	end
end
