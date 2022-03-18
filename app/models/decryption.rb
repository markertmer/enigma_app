class Decryption < ApplicationRecord
  validates :message, presence: true
  validates :key, presence: true
  validates :key, numericality: true
  validates :key, length: { is: 5 }
  validates :date, presence: true
  validates :date, numericality: true
  validates :date, length: { is: 6 }
end
