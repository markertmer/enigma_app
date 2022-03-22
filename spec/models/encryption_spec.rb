require 'rails_helper'

RSpec.describe Encryption, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_most(500) }
  end
end
