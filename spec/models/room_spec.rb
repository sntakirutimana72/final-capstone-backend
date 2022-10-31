require 'rails_helper'
RSpec.describe Room, type: :model do
  # Test associations.
  it { should belong_to(:room_type) }
  it { should have_many(:room_accomodations) }
  it { should have_many(:accomodations).through(:room_accomodations) }

  # Test validations.
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:number_of_beds) }
  it { should validate_presence_of(:picture) }

end
