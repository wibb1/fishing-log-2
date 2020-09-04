class Species < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :water_column, presence: true
  validates :legal_size, presence: true
  validates :legal_size_slot, presence: true
  validates :legal_size_super, presence: true
  validates :winter_season_start, presence: true
  validates :winter_bag_limit, presence: true
  validates :spring_season_start, presence: true
  validates :spring_bag_limit, presence: true
  validates :summer_season_start, presence: true
  validates :summer_bag_limit, presence: true
  validates :fall_season_start, presence: true
  validates :fall_bag_limit, presence: true

  has_and_belongs_to_many :records
end

