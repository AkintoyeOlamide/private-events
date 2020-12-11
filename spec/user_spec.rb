require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: 'dave')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:attendances) }
    it { should have_many(:concerned_events).through(:attendances) }
  end
end
