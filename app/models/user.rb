class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates_presence_of :first_name, :last_name
  validates :user_name, presence: true, uniqueness: true

  has_many :records
end
