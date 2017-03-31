class Movie < ApplicationRecord
  has_many :reviews
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :imdbID, uniqueness: true


  def self.search(search)
    where("title ILIKE ?",  "%#{search}%")
  end

  def data(type)
    url = "http://www.omdbapi.com/?i="
    title = self[:imdbID].split(" ").join("+")
    type = type.to_s.capitalize
    (JSON.parse open(url + title + "&plot=full").read)[type]
  end

  def imdbdata(type)
    url = "http://www.omdbapi.com/?i="
    title = self[:imdbID]
    type = type.to_s
    (JSON.parse open(url + title).read)[type]
  end

end
