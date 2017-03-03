class ResumeItem < ApplicationRecord
  has_many :jobs, dependent: :destroy
end
