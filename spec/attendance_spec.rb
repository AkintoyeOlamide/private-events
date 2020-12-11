require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject do
    described_class.new(
      invited_user_id: ''
    )
  end

  describe 'Validations' do
    it 'is not valid without valid attributes' do
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:concerned_event) }
    it { should belong_to(:invited_user) }
  end
end
