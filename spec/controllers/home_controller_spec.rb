require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    let (:uri) { URI("http://www.webmotors.com.br/carro/marcas") }
    let (:json_request) { JSON.parse Net::HTTP.post_form(uri, {}).body }
    let (:manufacturers_names) { json_request.map { |manufacturer| manufacturer["Nome"] }.uniq }

    it "stores manufacturers from WebMotors at Make model" do
      get :index
      makes_names = Make.all.map { |make| make.name }.uniq
      expect(response).to have_http_status :ok
      expect(makes_names).to match_array (manufacturers_names)
    end
  end
end
