class Make < ActiveRecord::Base
  has_many :models
  validates :name, :webmotors_id, uniqueness: true

  def self.populate_from_webmotors
    WebMotorsRequestAPI.get_makes.each do |make_params|
      if Make.where(name: make_params["Nome"]).size == 0
        Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
      end
    end
  end

  def populate_models_from_webmotors
    return if self.webmotors_id.nil?
    WebMotorsRequestAPI.get_models(webmotors_id).each do |model|
      if Model.where(name: model["Nome"]).size == 0
        self.models.create(name: model["Nome"])
      end
    end
  end
end
