require 'spec_helper'

describe TasksController do

  before :all do
  end

  def mock_task(stubs={})
    @mock_task ||= mock_model(Task, stubs)
  end

  describe "POST" do
    it "should create a tasks" do
      @story = Story.new
      Story.should_receive(:find).with("37").and_return(@story)
      @story.tasks.stub!(:build).with({"these"=>"params"}).and_return(@mock_task)
      @mock_task.should_receive(:save)
      post :create, :task => {:these => 'params'}, :story_id => "37"
    end
  end
end

