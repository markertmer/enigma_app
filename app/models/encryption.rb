class Encryption < ApplicationRecord
  validates :message, presence: true
end
