class SchoolsController < ApplicationController
	respond_to :html, :js

  def index
  	@schools = School.all
  end

  def new
  	@school = School.new
  end

  def create
  	@schools = School.all 
  	@school =  School.new(group_params)

  	@school.save

  	respond_to do |format|
       format.html { render :index }
       format.js
    end
  end

  

  def edit
    @school = School.find(params[:id])
  end

  def update
    @schools = School.all
    @school = School.find(params[:id])
    @school.update_attributes(group_params)
    @school.save

    respond_to do |format|
       format.html { render :index }
       format.js
    end

  end

  def delete
    @school = School.find(params[:school_id])
  end


  def destroy
      @schools = School.all
      @school = School.find(params[:id])
      @school.destroy
  end


  private
  	def group_params
  		params.require(:school).permit(:name, :address, :phone)
  	end
end
