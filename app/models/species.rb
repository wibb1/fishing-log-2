class Species < ApplicationRecord
  validates :name, presence: true
  validates :water_column, presence: true
  validates :legal_size, presence: true
  validates :legal_size_slot, presence: true
  validates :legal_size_super, presence: true 

  has_many :records
end

