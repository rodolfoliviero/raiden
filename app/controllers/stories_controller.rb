class StoriesController < ApplicationController

  before_filter :load_project

  # GET /stories/new
  def new
  end

  # POST
  def create
    @story = @project.stories.build((params[:story]))
    @story.save
  end

  # DELETE /stories/1
  def destroy
    Story.find(params[:id]).destroy
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

end

