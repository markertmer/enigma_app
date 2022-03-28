class Encryption < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { maximum: 500 }
  validates :key, numericality: true
  validates :key, length: { is: 5 }
  validates :key, format: { without: /\s/, message: "should not have spaces" }
end
