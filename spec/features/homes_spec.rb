require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  describe 'application root' do
    before(:each) do
      visit root_path
    end

    subject { page }
    it { is_expected.to have_select 'make_id' }
    it { is_expected.to have_content Make.all.sample.name }
    it { is_expected.to have_button 'Buscar modelos'}
    it { is_expected.to have_current_path root_path }

    context 'redirect to model index' do
      before(:each) do
        name = WebMotorsRequestAPI.get_makes_names.sample
        page.select name, from: 'make_id'
        @make = Make.find_by name: name
        @make2 = Make.where.not(id: @make.id).sample
        @make2.populate_models_from_webmotors
        click_button 'Buscar modelos'
      end

      it { is_expected.to have_current_path models_path('make_id' => @make.id) }
      it { is_expected.to have_text @make.models.sample.name }
      it { is_expected.not_to have_title @make2.models.sample.name }
      it { is_expected.to have_link("<< Voltar") }

      it 'returns to root after click on back link' do
        click_link '<< Voltar'
        expect(subject).to have_current_path root_path
      end
    end
  end
end
