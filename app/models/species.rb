class Species < ApplicationRecord
  validates_presence_of :common_name,
                        :scientific_name,
                        :water_column,
                        :legal_size,
                        :legal_size_slot,
                        :legal_size_super,
                        :winter_season_start,
                        :winter_bag_limit,
                        :spring_season_start,
                        :spring_bag_limit,
                        :summer_season_start,
                        :summer_bag_limit,
                        :fall_season_start,
                        :fall_bag_limit

  has_and_belongs_to_many :records
end
