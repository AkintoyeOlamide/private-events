require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "is valid with valid attributes"
  it "is not valid without a title"
  it "is not valid without a description"
  it "is not valid without a location"
  it "is not valid without a date"
end
