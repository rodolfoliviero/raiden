require 'spec_helper'

describe StoriesController do
  describe "routing" do
    before :each do
      @project_id = "2"
    end

    it "recognizes and generates #new" do
      { :get => "/projects/2/stories/new" }.should route_to(:controller => "stories", :action => "new",
                                                            :project_id => @project_id)
    end

    it "recognizes and generates #show" do
      { :get => "/projects/2/stories/1" }.should route_to(:controller => "stories", :action => "show",
                                                          :id => "1", :project_id => @project_id)
    end

    it "recognizes and generates #edit" do
      { :get => "/projects/2/stories/1/edit" }.should route_to(:controller => "stories", :action => "edit",
                                                               :id => "1", :project_id => @project_id)
    end

    it "recognizes and generates #create" do
      { :post => "/projects/2/stories" }.should route_to(:controller => "stories", :action => "create",
                                                         :project_id => @project_id)
    end

    it "recognizes and generates #update" do
      { :put => "/projects/2/stories/1" }.should route_to(:controller => "stories", :action => "update",
                                                          :id => "1", :project_id => @project_id)
    end

    it "recognizes and generates #destroy" do
      { :delete => "/projects/2/stories/1" }.should route_to(:controller => "stories", :action => "destroy",
                                                             :id => "1", :project_id => @project_id)
    end
  end
end

