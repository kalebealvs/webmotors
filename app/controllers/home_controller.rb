class HomeController < ApplicationController
  def index
    # Make request for Webmotors site
    json = WebMotorsRequestAPI.get_makes

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      if Make.where(name: make_params["Nome"]).size == 0
        Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
      end
    end

    @makes = Make.all
  end
end
