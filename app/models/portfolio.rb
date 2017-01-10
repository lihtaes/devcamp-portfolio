class Portfolio < ApplicationRecord
#The following method ensures that the selected data is present when creating a new database entry for respective model
  validates_presence_of :title, :body, :main_image, :thumb_image

# **SCOPE**
#Defining scope for a model can be done in two ways, the first is using the self method referring to the instance of the class, as in the below two examples:

#here:
def self.angular
  where(subtitle: 'Angular')
end

#and here:
def self.ruby
  where(subtitle: 'Ruby on Rails')
end





#**MORE SCOPE***
#Scope can also be defined as in the two lines below, and this is generally the preferred method for doing so.  
#The reason this is done here as opposed to in the controller is because it makes for cleaner code, and the controller is really where simple things should be done

#In the below to lines of code, you are allowing the controller to specifically call out for data assigned to the scope.  
#You attach a database query to a label, and using that label in the controller will pull only that data... 

#See portfolio_controller
scope :ruby, -> {where(subtitle: 'Ruby on Rails')}

scope :angular, -> {where(subtitle: 'Angular')}


#initialization takes place when the NEW method is called in the controller
after_intialize :set_defaults

  def set_defaults
    self.main_image ||= "https://placeholdit.imgix.net/~text?txtsize=33&txt=600×400&w=600&h=400"
    self.thumb_image ||= "https://placeholdit.imgix.net/~text?txtsize=33&txt=350×200&w=350&h=200"
  end
end