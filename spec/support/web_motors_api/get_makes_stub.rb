RSpec.configure do |config|
  config.before(:each) do
    manufacturers = [{ 'Nome' => 'CHEVROLET', 'Id' => '2' },
                     { 'Nome' => 'FORD', 'Id' => '3' },
                     { 'Nome' => 'FIAT', 'Id' => '4' }]
    models = { 2 => [{"Id"=>2089, "Nome"=>"CAMARO", "Count"=>0, "NomeAmigavel"=>"camaro"},
                     {"Id"=>1042, "Nome"=>"ASTRA", "Count"=>0, "NomeAmigavel"=>"astra"},
                     {"Id"=>1161, "Nome"=>"ZAFIRA", "Count"=>0, "NomeAmigavel"=>"zafira"}],
               3 => [{"Id"=>2183, "Nome"=>"F-350", "Count"=>0, "NomeAmigavel"=>"f-350"},
                     {"Id"=>687, "Nome"=>"FIESTA", "Count"=>0, "NomeAmigavel"=>"fiesta"},
                     {"Id"=>2709, "Nome"=>"FUSION", "Count"=>0, "NomeAmigavel"=>"fusion"}],
               4 => [{"Id"=>3301, "Nome"=>"GRAND SIENA", "Count"=>0, "NomeAmigavel"=>"grand-siena"},
                     {"Id"=>1111, "Nome"=>"BRAVA", "Count"=>0, "NomeAmigavel"=>"brava"},
                     {"Id"=>2165, "Nome"=>"PUNTO", "Count"=>0, "NomeAmigavel"=>"punto"}]}
    allow(WebMotorsRequestAPI).to receive(:get_makes) { manufacturers }
    models.keys.each { |id| allow(WebMotorsRequestAPI).to receive(:get_models).with(id) { models[id] } }
  end
end
