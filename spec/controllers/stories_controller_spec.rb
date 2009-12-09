require 'spec_helper'

describe StoriesController do

  before :all do
    @project_id = "2"
    Project.stub!(:find).with(@project_id).and_return(mock_project)
  end

  def mock_story(stubs={})
    @mock_story ||= mock_model(Story, stubs)
  end

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end

  describe "GET new" do
    it "assigns project as @project" do
      get :new, :project_id => @project_id
      assigns[:project].should equal(mock_project)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created story as @story" do
        Story.stub!(:new).with({'these' => 'params'}).and_return(mock_story(:save => true))
        post :create, :story => {:these => 'params'}, :project_id => @project_id
        assigns[:story].should equal(mock_story)
      end

      it "redirects to the created story" do
        Story.stub!(:new).and_return(mock_story(:save => true))
        post :create, :story => {}, :project_id => @project_id
        response.should redirect_to(story_url(mock_story))
      end
    end

  end

  describe "DELETE destroy" do

    it "destroys the requested story" do
      Story.should_receive(:find).with("37").and_return(mock_story)
      mock_story.should_receive(:destroy)
      delete :destroy, :id => "37", :project_id => @project_id
    end

    it "redirects to the project" do
      Story.stub!(:find).and_return(mock_story(:destroy => true))
      delete :destroy, :id => "1", :project_id => @project_id
      response.should redirect_to(mock_project)
    end
  end

end

