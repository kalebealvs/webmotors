require 'rails_helper'

RSpec.describe Make, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:webmotors_id) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:models) }
  end

  describe '.populate_from_webmotors' do
    it 'populate empty database' do
      expect(Make.all).to be_empty
      Make.populate_from_webmotors
      expect(Make.all).not_to be_empty
    end

    context 'database populated' do
      before(:each) do
        Make.populate_from_webmotors
        @count = Make.all.count
      end

      it 'does not create when no new record' do
        Make.populate_from_webmotors
        expect(Make.all.count).to eq(@count)
      end

      it 'create when api returns new record' do
        manufacturers = [{ 'Nome' => 'Fiction', 'Id' => '9999' }]
        allow(WebMotorsRequestAPI).to receive(:get_makes) { manufacturers }
        Make.populate_from_webmotors
        expect(Make.all.count).to eq(@count + 1)
        expect(Make.where(name: manufacturers.first['Nome']).count).to eq(1)
      end
    end
  end
end
