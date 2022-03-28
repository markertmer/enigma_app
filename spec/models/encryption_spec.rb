require 'rails_helper'

RSpec.describe Encryption, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_most(500) }
    it { should validate_numericality_of(:key) }
    it { should validate_length_of(:key).is_equal_to(5) }
    it { should_not allow_value(" ").for(:key) }
  end
end
