class Movie < ApplicationRecord
  has_many :reviews
  has_many :comments, as: :commentable

  validates :title, presence: true

  def self.search(search)
    where("title ILIKE ?",  "%#{search}%")
  end

  def data(type)
    url = "http://www.omdbapi.com/?t="
    title = self[:title].split(" ").join("+")
    type = type.to_s.capitalize
    (JSON.parse open(url + title).read)[type]
  end

end
