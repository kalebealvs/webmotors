require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    let (:manufacturers_names) { WebMotorsRequestAPI.get_makes_names }

    it "stores manufacturers from WebMotors at Make mod3l" do
      get :index
      makes_names = assigns[:makes].map { |make| make.name }.uniq
      expect(response).to have_http_status :ok
      expect(makes_names).to match_array (manufacturers_names)
    end
  end
end
