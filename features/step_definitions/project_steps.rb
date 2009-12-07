Given /^I have project named (.+)$/ do |names|
  names.split(', ').each do |name|
    Project.create!(:name => name)
  end
end

Given /^I have no project$/ do
  Project.delete_all
end

Then /^I should have ([0-9]+) project$/ do |count|
  Project.count.should == count.to_i
end

