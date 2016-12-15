require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  describe "GET index" do
    before(:each) do
      Make.populate_from_webmotors
      @make = Make.all.sample
      get :index, make_id: @make.id
    end

    it { expect(response).to have_http_status :ok }
    it { expect(Model.all).not_to be_empty }
    it { expect(assigns["models"].sample.make_id).to eq(@make.id)}
  end
end
