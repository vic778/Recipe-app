class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
