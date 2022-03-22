class Crack < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { maximum: 500 }
  validates :date, presence: true
  validates :date, numericality: true
  validates :date, length: { is: 6 }
end
