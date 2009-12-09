class StoriesController < ApplicationController

  before_filter :load_project

  # GET /stories/new
  def new
  end

  # POST /stories
  def create
    @story = @project.stories.build((params[:story]))
    @story.save
    flash[:notice] = 'Story was successfully created.'
    redirect_to @project
  end

  # DELETE /stories/1
  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to @project
  end

  private
    def load_project
       @project = Project.find(params[:project_id])
    end

end

