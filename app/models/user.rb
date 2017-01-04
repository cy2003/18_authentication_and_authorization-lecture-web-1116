class User < ApplicationRecord
  has_many :tweets
  validates :username, presence: true, uniqueness: true, exclusion: {in: %w(ryanseacrest carsondaly)}

end
