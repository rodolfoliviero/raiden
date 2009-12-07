require 'spec_helper'

describe "/stories/show.html.erb" do
  include StoriesHelper
  before(:each) do
    assigns[:story] = @story = stub_model(Story,
      :name => "value for name",
      :description => "value for description",
      :points => 1,
      :project => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
