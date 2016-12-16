
RSpec.configure do |config|
  WebMock.allow_net_connect!

  config.before(:each) do
    manufacturer_request = Net::HTTP.post_form(WebMotorsRequestAPI::URI_MANUFACTURERS, {})
    WebMock.stub_request(:post, WebMotorsRequestAPI::URI_MANUFACTURERS).
                to_return(body: manufacturer_request.body,
                status: 200)
  end
end
