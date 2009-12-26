require 'spec_helper'

describe TasksController do

  before :each do
    @story_id = "37"
    @story = Story.new(:id => @story_id)
    Story.stub!(:find).with("37").and_return(@story)
  end

  describe "POST create" do

    before :each do
      @story.tasks.stub!(:build).with({"these" => "params"}).and_return(@task = Task.new)
    end

    it "should create a task" do
      @task.should_receive(:save)
      post :create, :task => {:these => 'params'}, :story_id => @story_id
    end

    it "assigns story as @story" do
      @task.stub!(:save)
      post :create, :task => {:these => 'params'}, :story_id => @story_id
      assigns[:story].should equal(@story)
    end

    it "assigns task as @task" do
      @task.stub!(:save)
      post :create, :task => {:these => 'params'}, :story_id => @story_id
      assigns[:task].should equal(@task)
    end

  end

  describe "GET new" do
    it "assigns story as @story" do
      get :new, :story_id => @story_id
      assigns[:story].should equal(@story)
    end
  end
end

