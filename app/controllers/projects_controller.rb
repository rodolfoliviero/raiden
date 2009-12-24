class ProjectsController < ApplicationController
  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    @project.save
  end

  # DELETE /projects/1
  def destroy
    Project.find(params[:id]).destroy
    @projects = Project.all
  end
end

