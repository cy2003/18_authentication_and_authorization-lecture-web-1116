class User < ApplicationRecord
  extend Dogable
  has_many :tweets

  # if they have a username
  validates :username, presence: true, uniqueness: true, exclusion: {in: %w(ryanseacrest carsondaly)}
  # if the username is unique
  # if the username is not 'ryanseacrest'
end
