require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  describe "GET index" do
    before(:each) do
      Make.populate_from_webmotors
      @make = Make.all.sample
      get :index, make_id: @make.id
    end

    it { expect(response).to have_http_status :ok }
    it { expect(response).to render_template :index }
    it { expect(@make.models).not_to be_empty }
    it { expect(assigns["models"]).to eq(@make.models)}
  end
end
