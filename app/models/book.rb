class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :isbn, presence: true

  enum status: {available: 1, nonavailable: 0  }
end
