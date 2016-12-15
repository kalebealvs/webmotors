class ModelsController < ApplicationController
  def index
    make = Make.find_by webmotors_id: params[:webmotors_make_id]
    make.populate_models_from_webmotors
    @models = make.models
  end
end
