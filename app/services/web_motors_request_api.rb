class WebMotorsRequestAPI
  URI_MANUFACTURERS = URI('https://www.webmotors.com.br/carro/marcas')
  URI_MODELS = URI('https://www.webmotors.com.br/carro/modelos')

  def self.get_makes
    makes = JSON.parse Net::HTTP.post_form(URI_MANUFACTURERS, {}).body
    makes.each { |make| makes.delete make if make['Nome'] == ''}
    return makes.uniq
  end

  def self.get_makes_names
    get_makes.map { |manufacturer| manufacturer["Nome"] }.uniq
  end

  def self.get_models(make)
    JSON.parse Net::HTTP.post_form(URI_MODELS, { marca: make }).body
  end
end
