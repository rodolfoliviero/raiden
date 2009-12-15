class Project < ActiveRecord::Base
  has_many :stories, :dependent => :delete_all
end

