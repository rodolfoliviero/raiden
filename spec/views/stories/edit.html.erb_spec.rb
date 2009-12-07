require 'spec_helper'

describe "/stories/edit.html.erb" do
  include StoriesHelper

  before(:each) do
    assigns[:story] = @story = stub_model(Story,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :points => 1,
      :project => 1
    )
  end

  it "renders the edit story form" do
    render

    response.should have_tag("form[action=#{story_path(@story)}][method=post]") do
      with_tag('input#story_name[name=?]', "story[name]")
      with_tag('input#story_description[name=?]', "story[description]")
      with_tag('input#story_points[name=?]', "story[points]")
      with_tag('input#story_project[name=?]', "story[project]")
    end
  end
end
