require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:make) }
  end
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
