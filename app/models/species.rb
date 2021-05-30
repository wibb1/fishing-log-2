class Species < ApplicationRecord
  validates_presence_of :common_name,
                        :scientific_name,
                        :shallow_depth,
                        :deep_depth

  has_and_belongs_to_many :records
end
