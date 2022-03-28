class Decryption < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { maximum: 500 }
  validates :key, presence: true
  validates :key, numericality: true
  validates :key, length: { is: 5 }
  validates :key, format: { without: /\s/, message: "should not have spaces" }
  validates :date, presence: true
  validates :date, numericality: true
  validates :date, length: { is: 6 }
  validates :date, format: { without: /\s/, message: "should not have spaces" }
end
