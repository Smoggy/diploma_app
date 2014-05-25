class TeachersController < ApplicationController
	
	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
		@subjects = Subject.all
	end

	def create
		@teachers = Teacher.all
		@teacher = Teacher.create teacher_params

		respond_to do |format|
       		format.html { render :index }
       		format.js
    	end
	end

	def edit
		@teacher = Teacher.find_by_id(params[:id])
		@subjects = Subject.all
	end

	def update
		 @teachers = Teacher.all
    	 @teacher = Teacher.find(params[:id])
    	 @teacher.update_attributes(teacher_params)
   		 @teacher.save

   		 respond_to do |format|
       		format.html { render :index }
       		format.js
    	end
	end


	def delete
		@teacher = Teacher.find_by_id(params[:teacher_id])
	end

	def destroy
		@teachers = Teacher.all
      	@teacher = Teacher.find(params[:id])
     	@teacher.destroy
	end

	def find_by_filters

	end


	private

		def teacher_params
			params.require(:teacher).permit(:first_name, :last_name, :email, :phone, :is_candidate, :subject_id)
		end

end
