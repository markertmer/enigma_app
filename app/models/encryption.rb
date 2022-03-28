class Encryption < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { maximum: 500 }

  validates :key, numericality: true, unless: -> { key.blank? }
  validates :key, length: { is: 5 }, unless: -> { key.blank? }
  validates :key, format: { without: /\s/, message: "should not have spaces" }, unless: -> { key.blank? }

end
