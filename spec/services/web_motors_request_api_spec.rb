require 'rails_helper'

RSpec.describe WebMotorsRequestAPI do
  describe '.get_makes' do
    subject { WebMotorsRequestAPI.get_makes }
    it { is_expected.to be_kind_of(Array) }
    it { is_expected.not_to be_empty }
    it 'has hash' do
      expect(subject.first).to be_kind_of(Hash)
    end
  end

  describe '.get_makes_names' do
    subject { WebMotorsRequestAPI.get_makes_names }
    it { is_expected.to be_kind_of(Array) }
    it { is_expected.not_to be_empty }
    it 'has string' do
      expect(subject.first).to be_kind_of(String)
    end
  end

  describe '.get_models' do
    before(:each) do
      Make.populate_from_webmotors
    end

    subject { WebMotorsRequestAPI.get_models(Make.all.sample.webmotors_id) }
    it { is_expected.to be_kind_of(Array) }
    it { is_expected.not_to be_empty }
    it 'has hash' do
      expect(subject.first).to be_kind_of(Hash)
    end
  end
end
