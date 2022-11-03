require 'rails_helper'

RSpec.describe(Reservation, type: :model) do
  describe('associations') do
    it('should belong to a :user') { should belong_to(:user) }
    it('should belong to a :room') { should belong_to(:room) }
  end

  describe('validations') do
    let(:user) { create_user }
    let(:room) { create_room }

    after(:each) { reset_all }

    it('should be valid') do
      expect(described_class.new(user:, room:, from_date: Date.today, to_date: Date.today)).to be_valid
    end

    it('should not be valid without :from_date') do
      expect(described_class.new(user:, room:, to_date: Date.today)).not_to be_valid
    end

    it('should not be valid without :to_date') do
      expect(described_class.new(user:, room:, from_date: Date.today)).not_to be_valid
    end

    it('should not be valid when :from_date < Date.today') do
      expect(described_class.new(user:, room:, from_date: Date.today - 1.day)).not_to be_valid
    end

    it('should not be valid when :from_date > :to_date') do
      expect(
        described_class.new(user:, room:, from_date: Date.today, to_date: Date.today - 1.day)
      ).not_to be_valid
    end
  end
end
