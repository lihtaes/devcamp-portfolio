class Portfolio < ApplicationRecord
#The following method ensures that the selected data is present when creating a new database entry for respective model
  validates_presence_of :title, :body, :main_image, :thumb_image

end
