class Movie < ApplicationRecord
  has_many :reviews
  has_many :comments, as: :commentable

  validates :title, presence: true

  def self.search(search)
    where("title ILIKE ?",  "%#{search}%")
  end
end
