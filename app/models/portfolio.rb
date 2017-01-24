class Portfolio < ApplicationRecord
  
#New model technology, associated with Portfolio, with the has_many/belongs_to
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder



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

#In the below two lines of code, you are allowing the controller to specifically call out for data assigned to the scope.  
#You attach a database query to a label, and using that label in the controller will pull only that data... 

#See portfolio_controller
scope :ruby, -> {where(subtitle: 'Ruby on Rails')}

scope :angular, -> {where(subtitle: 'Angular')}

scope :by_position, -> {order('position ASC')}

#initialization takes place when the NEW method is called in the controller
after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

end