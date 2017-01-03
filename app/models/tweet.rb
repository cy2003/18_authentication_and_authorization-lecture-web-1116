class Tweet < ApplicationRecord
  belongs_to :user

  # A tweet is valid if:

  ## 1. it has a valid user ID associated
  ## 2. if it has some content
  ## 3. if the content is less than or equal to 140 characters
  ## 4. if the content is not 'dog'
end
