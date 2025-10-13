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

  def test_check
    stub_request(:post, "https://api.sightengine.com/1.0/check.json?api_secret=test_secret&api_user=test_user&models=nudity,wad,properties&url=https://example.com/image.jpg").
      to_return(status: 200, body: '{"status":"success"}', headers: {})

    client = SightengineRuby::Client.new
    response = client.check("nudity,wad,properties", "https://example.com/image.jpg")

    assert_equal "success", response["status"]
  end

  def test_set_celebrity
    stub_request(:post, "https://api.sightengine.com/1.0/celebrities.json?api_secret=test_secret&api_user=test_user&id=123&url=https://example.com/image.jpg").
      to_return(status: 200, body: '{"status":"success"}', headers: {})

    client = SightengineRuby::Client.new
    response = client.set_celebrity("123", "https://example.com/image.jpg")

    assert_equal "success", response["status"]
  end
end
