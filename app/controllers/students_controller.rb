class StudentsController < ApplicationController
	respond_to :html, :js

  def index
  	@group = Group.find(params[:format])
  	@students = @group.students
  end

  def xls_index
    @students = Student.all
  end

  def new
  	@group = Group.find(params[:format])
  	@student = Student.new
  end

  def create
  	@students = Student.all 
  	@student =  Student.create_student params

  	respond_to do |format|
       format.html { render :index }
       format.js
    end
  end

  

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @students = Student.all
    @student = Student.find(params[:id])
    @student.update_attributes(group_params)
    @student.save

    respond_to do |format|
       format.html { render :index }
       format.js
    end

  end

  def delete
    @student = Student.find(params[:student_id])
  end


  def destroy
      @students = Student.all
      @student = Student.find(params[:id])
      @student.destroy
  end


  private
  	
end
