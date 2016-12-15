class ModelsController < ApplicationController
  def index
    make = Make.find params[:make_id]
    make.populate_models_from_webmotors
    @models = make.models
  end
end
