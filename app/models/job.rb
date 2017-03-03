class Job < ApplicationRecord
  belongs_to :resume_item
  validates_presence_of :task, :resume_item_id
end
