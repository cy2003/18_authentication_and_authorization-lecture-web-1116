class Tweet < ApplicationRecord
  belongs_to :user #, optional: true
  extend Dogable

  # A tweet is valid if:

  ## 1. it has a valid user ID associated
  # validates :user, presence: true
  ## 2. if it has some content
  validates :content, presence: true, length: {maximum: 140}
  validates :content, exclusion: {in: ["dog"] }
  ## 3. if the content is less than or equal to 140 characters
  ## 4. if the content is not 'dog'
  validate :content_doesnt_include_dog

  private

  def content_doesnt_include_dog
    if content.downcase.include?('dog')
      errors.add(:content, "cannot include the word dog")
    end
  end
end
