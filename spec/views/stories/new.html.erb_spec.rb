require 'spec_helper'

describe "/stories/new.html.erb" do
  include StoriesHelper

  before(:each) do
    assigns[:story] = stub_model(Story,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :points => 1,
      :project => 1
    )
  end

  it "renders new story form" do
    render

    response.should have_tag("form[action=?][method=post]", stories_path) do
      with_tag("input#story_name[name=?]", "story[name]")
      with_tag("input#story_description[name=?]", "story[description]")
      with_tag("input#story_points[name=?]", "story[points]")
      with_tag("input#story_project[name=?]", "story[project]")
    end
  end
end
