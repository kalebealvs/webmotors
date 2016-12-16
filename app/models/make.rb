class Make < ActiveRecord::Base
  has_many :models
  validates :name, :webmotors_id, uniqueness: true
  validates :name, :webmotors_id, presence: true

  def self.populate_from_webmotors
    select_new(WebMotorsRequestAPI.get_makes).each do |make_params|
      Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
    end
  end

  def populate_models_from_webmotors
    return if webmotors_id.nil?
    WebMotorsRequestAPI.get_models(webmotors_id).each do |model|
      models.create(name: model["Nome"]) if Model.where(name: model["Nome"]).none?
    end
  end

  def self.names(make_list = Array.new)
    names = Array.new
    stored_makes = Make.all
    return names if stored_makes.empty? and make_list.empty?
    make_list = stored_makes if make_list.empty?
    make_list.each { |make| names << ( make.class ==  Hash ? make['Nome'] : make.name ) }
    return names
  end

  private_class_method def self.select_new(makes)
    return Array.new if makes.empty?
    names = names(makes) - Make.names
    new_makes = Array.new
    makes.each { |make| new_makes << make if names.include? make['Nome']}
    return new_makes
  end
end
