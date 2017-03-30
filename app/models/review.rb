class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, :ratings, :user, :movie, presence: true
end
