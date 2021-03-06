require 'spec_helper'

describe Story do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :points => 1,
      :project_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Story.create!(@valid_attributes)
  end

   it "should cascade when delete story" do
     should have_many(:tasks, :dependent => :delete_all)
  end
end

