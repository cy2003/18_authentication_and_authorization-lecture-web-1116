class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 140}
  validates :content, exclusion: {in: ["dog"] }
  validate :content_doesnt_include_dog

  private

  def content_doesnt_include_dog
    if content.downcase.include?('dog')
      errors.add(:content, "cannot include the word dog")
    end
  end
end
