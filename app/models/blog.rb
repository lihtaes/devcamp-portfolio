class Blog < ApplicationRecord
  
#here you are having your class extend the FriendlyId class to allow access to the methods within for use in custom  
#formatting the data that becomes the visible URL on your live site
  extend FriendlyId
  friendly_id :title, use: :slugged


#You can use an ENUM to have a conditional value attached to a database entry, such as below,
#where the entry can either be marked as draft, or published, and use this to register a boolean to control
#data output onto production

#notice the param passed into enum is the datafield in the database, and that it then becomes a hash with the key being what will be 
#output, and the value being what can be input, so setting status to 1 will output "published" if you wanted to.
  enum status: { draft: 0, published: 1 }
  



#The following method ensures that the selected data is present when creating a new database entry for respective model
  validates_presence_of :title, :body

#the blog model needs to know that it belongs to a specific topic with the 
# following method
  belongs_to :topic

end
