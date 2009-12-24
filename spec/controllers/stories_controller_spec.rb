require 'spec_helper'

describe StoriesController do

  before :all do
    @project_id = "2"
  end

  def mock_story(stubs={})
    @mock_story ||= mock_model(Story, stubs)
  end

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end

  describe "GET new" do
    it "assigns project as @project" do
      Project.stub!(:find).with(@project_id).and_return(mock_project)
      get :new, :project_id => @project_id
      assigns[:project].should equal(mock_project)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      before :all do
         @project = Project.new
         @project.id = @project_id
      end

      it "assigns a newly created story as @story" do
        Project.stub!(:find).with(@project_id).and_return(@project)
        @project.stories.stub!(:build).with({"these"=>"params"}).and_return(mock_story(:save => true))
        post :create, :story => {:these => 'params'}, :project_id => @project_id
        assigns[:project].should equal(@project)
      end

    end

  end

  describe "DELETE destroy" do
    it "destroys the requested story" do
      Project.stub!(:find).with(@project_id).and_return(mock_project)
      Story.should_receive(:find).with("37").and_return(mock_story)
      mock_story.should_receive(:destroy)
      delete :destroy, :id => "37", :project_id => @project_id
      assigns[:project].should equal(mock_project)
    end
  end

end

