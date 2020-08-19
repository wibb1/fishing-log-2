class Record < ApplicationRecord
  validates :name, presence: true
  validates :success, presence: true
  
  belongs_to :user
end