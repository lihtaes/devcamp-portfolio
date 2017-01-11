class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #make sure the name is there so that your next methods won't return an error
  validates_presence_of :name       

  def first_name
    self.name.split.first
  end


  def last_name
    self.name.split.last
  end

end
