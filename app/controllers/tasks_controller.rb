class TasksController < ApplicationController

   def create
    @story = Story.find(params[:story_id])
    @task = @story.tasks.build((params[:task]))
    @task.save
  end

end

