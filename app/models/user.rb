class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness:true
  has_many :reviews
  has_many :comments
  has_many :favorite_movies
  has_many :watchlists
  has_many :favorites, through: :favorite_movies, source: :movie
  has_many :movies_to_watch, through: :watchlists, source: :movie
end
