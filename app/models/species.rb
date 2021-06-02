class Species < ApplicationRecord
  validates_presence_of :common_name,
                        :scientific_name,
                        :shallow_depth,
                        :deep_depth
  validates_uniqueness_of :common_name, :scientific_name
  has_many :records
end
