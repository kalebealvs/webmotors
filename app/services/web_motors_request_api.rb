class WebMotorsRequestAPI
  URI_MANUFACTURERS = URI('http://www.webmotors.com.br/carro/marcas')

  def self.get_makes
    JSON.parse Net::HTTP.post_form(URI_MANUFACTURERS, {}).body
  end

  def self.get_makes_names
    get_makes.map { |manufacturer| manufacturer["Nome"] }.uniq
  end
end
