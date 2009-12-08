class StoriesController < ApplicationController
  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  def new
    @project = Project.find(params[:project_id])
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.build((params[:story]))
    @story.save
    flash[:notice] = 'Story was successfully created.'
    redirect_to @project
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  def destroy
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to @project
  end
end

