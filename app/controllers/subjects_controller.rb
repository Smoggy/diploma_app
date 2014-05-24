class SubjectsController < ApplicationController
	def index
		@subjects = Subject.all
	end

	def new
		@subject = Subject.new
	end

	def create
		@sujects = Subject.all
		@subject = Subject.new subject_params

  		respond_to do |format|
       		format.html { render :index }
       		format.js
    	end
	end

	def edit
		 @subject = Subject.find(params[:id])
	end

	def update
		 @subjects = Subject.all
    	 @subject = Subject.find(params[:id])
    	 @subject.update_attributes(subject_params)
   		 @subject.save

   		 respond_to do |format|
       		format.html { render :index }
       		format.js
    	end

	end

	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		@subjects = Group.all
      	@subject = Group.find(params[:id])
     	@subject.destroy
	end


	

	private

		def subject_params
			params.require(:subject).permit(:name, :description)
		end
end
