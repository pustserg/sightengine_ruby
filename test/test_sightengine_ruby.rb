# frozen_string_literal: true

require "test_helper"

class TestSightengineRuby < Minitest::Test
  def setup
    SightengineRuby.configure do |config|
      config.api_user = "test_user"
      config.api_secret = "test_secret"
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::SightengineRuby::VERSION
  end

  def test_check_with_file
    stub_request(:post, "https://api.sightengine.com/1.0/check.json").
      with(body: /Content-Disposition: form-data; name="media"; filename="test_image.jpg"/).
      to_return(status: 200, body: '{"status":"success"}', headers: {})

    client = SightengineRuby::Client.new
    response = client.check("nudity,wad,properties", file: "test/test_image.jpg")

    assert_equal "success", response["status"]
  end

  def test_set_celebrity_with_file
    stub_request(:post, "https://api.sightengine.com/1.0/celebrities.json").
      with(body: /Content-Disposition: form-data; name="media"; filename="test_image.jpg"/).
      to_return(status: 200, body: '{"status":"success"}', headers: {})

    client = SightengineRuby::Client.new
    response = client.set_celebrity("123", file: "test/test_image.jpg")

    assert_equal "success", response["status"]
  end
end
