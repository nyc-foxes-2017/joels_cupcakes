class Watchlist < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user
  belongs_to :user
  belongs_to :movie
end
