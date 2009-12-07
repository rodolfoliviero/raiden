Given /^I have no story$/ do
  Story.delete_all
end

Then /^I should have ([0-9]+) stories$/ do |count|
  Story.count.should == count.to_i
end

Given /^(.+) has story named (.+)$/ do |project, names|
  names.split(', ').each do |name|
     Project.find_by_name(project).stories.build(:name => name).save
  end
end

