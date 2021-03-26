class Review < ApplicationRecord
  belongs_to :product
  validates :title, presence: true 
  validates :author, presence: true 
  validates_length_of  :content_body, minimum: 50, maximum: 250
  validates_inclusion_of :rating, in: 1..5

  scope :recent_reviews, -> { order(created_at: :desc).limit(7)}
end