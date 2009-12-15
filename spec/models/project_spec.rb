require 'spec_helper'

describe Project do

  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end

  it "should cascade when delete project" do
     should have_many(:stories, :dependent => :delete_all)
  end

end

