class Encryption < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { maximum: 500 }
end
