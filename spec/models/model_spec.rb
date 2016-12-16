require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:make) }
  end
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:make_id) }
    it { expect(Model.new(id: 99999, name: 'Fiction')).to be_invalid }

    it 'should require valid make_id with error message' do
      model = Model.new(id: 99999, name: 'Fiction', make_id: 88888)
      model.save
      message = [['must have a valid Maker']]
      expect(model.persisted?).to eq(false)
      expect(model.errors.messages.values).to match_array(message)
    end
  end
end
