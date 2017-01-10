class Skill < ApplicationRecord
#The following method ensures that the selected data is present when creating a new database entry for respective model
  validates_presence_of :title, :percent_utilized
end
