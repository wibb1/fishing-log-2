class Species < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :water_column, presence: true
  validates :legal_size, presence: true
  validates :legal_size_slot, presence: true
  validates :legal_size_super, presence: true 

  has_and_beongs_to_many :records
  
end

