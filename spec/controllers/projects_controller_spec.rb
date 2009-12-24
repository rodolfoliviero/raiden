require 'spec_helper'

describe ProjectsController do

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      Project.stub!(:find).with(:all).and_return([mock_project])
      get :index
      assigns[:projects].should == [mock_project]
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      Project.stub!(:find).with("37").and_return(mock_project)
      get :show, :id => "37"
      assigns[:project].should equal(mock_project)
    end
  end

  describe "POST create" do
      it "assigns a newly created project as @project" do
        Project.stub!(:new).with({'these' => 'params'}).and_return(mock_project(:save => true))
        post :create, :project => {:these => 'params'}
        assigns[:project].should equal(mock_project)
      end
  end

  describe "DELETE destroy" do
    it "destroys the requested project" do
      Project.stub!(:all)
      Project.should_receive(:find).with("37").and_return(mock_project)
      mock_project.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "assigns projects" do
      Project.stub!(:find).with("1").and_return(mock_project)
      mock_project.stub!(:destroy)
      Project.should_receive(:all).and_return(mock_project)
      delete :destroy, :id => "1"
      assigns[:projects].should equal(mock_project)
    end
  end

end

