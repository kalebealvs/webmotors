RSpec.configure do |config|
  config.before(:each) do
    manufacturers = [{ 'Nome' => 'CHEVROLET', 'Id' => '2' },
                     { 'Nome' => 'FORD', 'Id' => '3' },
                     { 'Nome' => 'FIAT', 'Id' => '4' }]
    allow(WebMotorsRequestAPI).to receive(:get_makes) { manufacturers }
  end
end
