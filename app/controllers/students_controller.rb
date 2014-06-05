class StudentsController < ApplicationController
	respond_to :html, :js


  def students_of_group
    @group = Group.find_by_id(params[:format])
    @students = @group.students
  end

  def index
  	@students = Student.all.includes(:group).includes(:school)
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

  def xls_creator
    package = Axlsx::Package.new
    workbook = package.workbook
    @students = Student.all
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["Student Name", "Address", "Phone", "Email", "School", "Group"]
      @students.each do |s|
         sheet.add_row ["#{s.first_name} #{s.last_name}", s.address, s.phone_number, s.email, s.school.name, s.group.name]
      end
    end
    package.serialize "Basic.xlsx"
    send_file("#{Rails.root}/Basic.xlsx", filename: "Basic.xlsx", type: "application/vnd.ms-excel")
  end

  private
  	
end
