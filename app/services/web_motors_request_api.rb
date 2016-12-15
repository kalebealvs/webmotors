class WebMotorsRequestAPI
  URI_MANUFACTURERS = URI('http://www.webmotors.com.br/carro/marcas')
  URI_MODELS = URI('http://www.webmotors.com.br/carro/modelos')

  def self.get_makes
    JSON.parse Net::HTTP.post_form(URI_MANUFACTURERS, {}).body
  end

  def self.get_makes_names
    get_makes.map { |manufacturer| manufacturer["Nome"] }.uniq
  end

  def self.get_models(make)
    JSON.parse Net::HTTP.post_form(URI_MODELS, { marca: make.webmotors_id }).body
  end
end
