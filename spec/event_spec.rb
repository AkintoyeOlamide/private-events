require 'rails_helper'

RSpec.describe Event, :type => :model do

  subject {
    described_class.new(
      title: "Anything",
      description: "Anything",
      date: DateTime.now,
      location: "Anything"
    )}

  describe "Validations" do

    it "is not valid without valid attributes or creator" do
      expect(subject).to_not be_valid
    end
    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a location" do
      subject.location = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a date" do
      subject.date = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:creator).without_validating_presence }
    it { should have_many(:attendances) }
    it { should have_many(:invited_users).through(:attendances) }
  end


end
