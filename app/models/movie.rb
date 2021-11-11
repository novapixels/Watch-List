class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, presence: true, allow_blank: false
  validates :title, uniqueness: true
end
