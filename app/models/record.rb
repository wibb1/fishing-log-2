class Record < ApplicationRecord
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :datetime, presence: true
  validates :js_date, presence: true

  belongs_to :user
end