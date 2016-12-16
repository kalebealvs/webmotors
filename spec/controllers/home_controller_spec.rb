require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    before(:each) do
      get :index
    end

    it { expect(response).to have_http_status :ok }
    it { expect(response).to render_template :index }
    it { expect(assigns[:makes]).to eq(Make.all) }
  end
end
