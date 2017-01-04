class User < ApplicationRecord
  has_many :tweets
  has_secure_password
  validates :username, presence: true, uniqueness: true, exclusion: {in: %w(ryanseacrest carsondaly)}

end
