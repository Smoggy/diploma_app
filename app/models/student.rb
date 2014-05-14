class Student < ActiveRecord::Base

	belongs_to :group
	belongs_to :school

	def self.create_student params
		student = Student.new student_params(params)

		school = School.find_by_name params[:student][:school]

		if school
			student.school = school
			student.save

		else
			student.errors.add(:school, "is not in the base")
		end
		student
	end


	private

		def self.student_params params
  			params.require(:student).permit(:first_name,:last_name,:email, :address, :phone_number, :group_id)
  		end
end
