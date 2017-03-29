class Movie < ApplicationRecord
  has_many :reviews
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :director, presence: true
  validates :cast, presence: true
end
