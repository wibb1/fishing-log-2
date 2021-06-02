class Species < ApplicationRecord
  validates_presence_of :common_name,
                        :scientific_name,
                        :shallow_depth,
                        :deep_depth
  has_many :records
end
